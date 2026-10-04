import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/penyewaan_repository_impl.dart';
import '../../domain/entities/penyewaan_entity.dart';
import '../../domain/repositories/penyewaan_repository.dart';

final penyewaanRepositoryProvider = Provider<PenyewaanRepository>((ref) {
  return PenyewaanRepositoryImpl(ref.watch(databaseProvider));
});

class PenyewaanState {
  final List<PenyewaanEntity> items;
  final bool isLoading;
  final String? error;
  final String? filterStatus;

  const PenyewaanState({
    this.items = const [],
    this.isLoading = false,
    this.error,
    this.filterStatus,
  });

  PenyewaanState copyWith({
    List<PenyewaanEntity>? items,
    bool? isLoading,
    String? error,
    String? filterStatus,
    bool clearError = false,
    bool clearFilter = false,
  }) {
    return PenyewaanState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      filterStatus: clearFilter ? null : (filterStatus ?? this.filterStatus),
    );
  }
}

class PenyewaanNotifier extends Notifier<PenyewaanState> {
  PenyewaanRepository get _repo => ref.read(penyewaanRepositoryProvider);

  @override
  PenyewaanState build() {
    Future.microtask(() => load());
    return const PenyewaanState(isLoading: true);
  }

  Future<void> load({String? status, bool clearFilter = false}) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      filterStatus: clearFilter ? null : (status ?? state.filterStatus),
      clearFilter: clearFilter,
    );

    try {
      final authState = ref.read(authProvider);
      final user = authState is AuthAuthenticated ? authState.user : null;
      if (user == null) {
        state = state.copyWith(items: [], isLoading: false);
        return;
      }

      // Filter by role
      int? idPeminjam;
      int? idOrganisasi;

      if (user.role == 'penyewa') {
        // Cari peminjam yang terhubung dengan user ini
        final db = ref.read(databaseProvider);
        final peminjam =
            await (db.select(db.peminjam)
                  ..where((t) => t.idUser.equals(user.idUser))
                  ..limit(1))
                .getSingleOrNull();
        if (peminjam != null) {
          idPeminjam = peminjam.idPeminjam;
        }
      } else if (user.role == 'ormawa') {
        // Cari organisasi yang terhubung
        final db = ref.read(databaseProvider);
        final userOrg =
            await (db.select(db.userOrganisasi)
                  ..where((t) => t.idUser.equals(user.idUser))
                  ..limit(1))
                .getSingleOrNull();
        if (userOrg != null) {
          idOrganisasi = userOrg.idOrganisasi;
        }
      }
      // Admin: tanpa filter (lihat semua)

      final items = await _repo.getAll(
        idPeminjam: idPeminjam,
        idOrganisasi: idOrganisasi,
        status: state.filterStatus,
      );

      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<String?> create(CreatePenyewaanData data) async {
    try {
      final kode = await _repo.create(data);
      await load();
      return null; // sukses
    } catch (e) {
      return 'Gagal membuat penyewaan: $e';
    }
  }

  Future<String?> updateStatus(int idSewa, String statusBaru) async {
    try {
      await _repo.updateStatus(idSewa, statusBaru);
      await load();
      return null;
    } catch (e) {
      return 'Gagal mengubah status: $e';
    }
  }

  Future<String?> delete(int idSewa) async {
    try {
      await _repo.softDelete(idSewa);
      await load();
      return null;
    } catch (e) {
      return 'Gagal menghapus: $e';
    }
  }
}

final penyewaanProvider = NotifierProvider<PenyewaanNotifier, PenyewaanState>(
  () => PenyewaanNotifier(),
);

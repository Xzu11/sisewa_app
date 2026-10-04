import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../data/repositories/kategori_repository_impl.dart';
import '../../domain/entities/kategori_entity.dart';
import '../../domain/repositories/kategori_repository.dart';

// ============================================================
// REPOSITORY PROVIDER
// ============================================================
final kategoriRepositoryProvider = Provider<KategoriRepository>((ref) {
  return KategoriRepositoryImpl(ref.watch(databaseProvider));
});

// ============================================================
// STATE
// ============================================================
class KategoriState {
  final List<KategoriEntity> items;
  final bool isLoading;
  final String? error;
  final String searchQuery;

  const KategoriState({
    this.items = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
  });

  KategoriState copyWith({
    List<KategoriEntity>? items,
    bool? isLoading,
    String? error,
    String? searchQuery,
    bool clearError = false,
  }) {
    return KategoriState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// ============================================================
// NOTIFIER
// ============================================================
class KategoriNotifier extends Notifier<KategoriState> {
  KategoriRepository get _repo => ref.read(kategoriRepositoryProvider);

  @override
  KategoriState build() {
    // Load data saat pertama kali provider diakses
    Future.microtask(() => load());
    return const KategoriState(isLoading: true);
  }

  Future<void> load({String? search}) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      searchQuery: search ?? state.searchQuery,
    );
    try {
      final items = await _repo.getAll(search: state.searchQuery);
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> create({required String namaKategori, String? deskripsi}) async {
    try {
      final taken = await _repo.isNamaTaken(namaKategori);
      if (taken) {
        state = state.copyWith(
          error: 'Nama kategori "$namaKategori" sudah ada',
        );
        return false;
      }
      await _repo.create(namaKategori: namaKategori, deskripsi: deskripsi);
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal menambah: $e');
      return false;
    }
  }

  Future<bool> update({
    required int idKategori,
    required String namaKategori,
    String? deskripsi,
  }) async {
    try {
      final taken = await _repo.isNamaTaken(
        namaKategori,
        excludeId: idKategori,
      );
      if (taken) {
        state = state.copyWith(
          error: 'Nama kategori "$namaKategori" sudah ada',
        );
        return false;
      }
      await _repo.update(
        idKategori: idKategori,
        namaKategori: namaKategori,
        deskripsi: deskripsi,
      );
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal mengubah: $e');
      return false;
    }
  }

  Future<bool> delete(int idKategori) async {
    try {
      await _repo.softDelete(idKategori);
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal menghapus: $e');
      return false;
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}

final kategoriProvider = NotifierProvider<KategoriNotifier, KategoriState>(
  () => KategoriNotifier(),
);

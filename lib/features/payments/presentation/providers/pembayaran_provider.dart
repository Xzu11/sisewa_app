import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/pembayaran_repository_impl.dart';
import '../../domain/entities/pembayaran_entity.dart';
import '../../domain/repositories/pembayaran_repository.dart';

final pembayaranRepositoryProvider = Provider<PembayaranRepository>((ref) {
  return PembayaranRepositoryImpl(ref.watch(databaseProvider));
});

final pembayaranListProvider = FutureProvider<List<PembayaranEntity>>((
  ref,
) async {
  final repo = ref.watch(pembayaranRepositoryProvider);
  final authState = ref.watch(authProvider);
  final user = authState is AuthAuthenticated ? authState.user : null;
  final db = ref.watch(databaseProvider);

  int? idPeminjam;
  int? idOrganisasi;

  if (user?.role == 'penyewa') {
    final p =
        await (db.select(db.peminjam)
              ..where((t) => t.idUser.equals(user!.idUser))
              ..limit(1))
            .getSingleOrNull();
    idPeminjam = p?.idPeminjam;
  } else if (user?.role == 'ormawa') {
    final uo =
        await (db.select(db.userOrganisasi)
              ..where((t) => t.idUser.equals(user!.idUser))
              ..limit(1))
            .getSingleOrNull();
    idOrganisasi = uo?.idOrganisasi;
  }

  return repo.getAll(idPeminjam: idPeminjam, idOrganisasi: idOrganisasi);
});

final penyewaanBelumLunasProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(pembayaranRepositoryProvider);
  final authState = ref.watch(authProvider);
  final user = authState is AuthAuthenticated ? authState.user : null;
  final db = ref.watch(databaseProvider);

  int? idPeminjam;
  if (user?.role == 'penyewa') {
    final p =
        await (db.select(db.peminjam)
              ..where((t) => t.idUser.equals(user!.idUser))
              ..limit(1))
            .getSingleOrNull();
    idPeminjam = p?.idPeminjam;
  }
  return repo.getPenyewaanBelumLunas(idPeminjam: idPeminjam);
});

class PembayaranActionNotifier extends Notifier<void> {
  @override
  void build() {}

  Future<String?> create({
    required int idSewa,
    required String jenisPembayaran,
    required String metodePembayaran,
    required double jumlahBayar,
    String? keterangan,
    int? idAdmin,
  }) async {
    try {
      await ref
          .read(pembayaranRepositoryProvider)
          .create(
            idSewa: idSewa,
            jenisPembayaran: jenisPembayaran,
            metodePembayaran: metodePembayaran,
            jumlahBayar: jumlahBayar,
            keterangan: keterangan,
            idAdmin: idAdmin,
          );
      ref.invalidate(pembayaranListProvider);
      ref.invalidate(penyewaanBelumLunasProvider);
      return null;
    } catch (e) {
      return 'Gagal: $e';
    }
  }

  Future<String?> verify(int id, String status) async {
    try {
      await ref.read(pembayaranRepositoryProvider).updateStatus(id, status);
      ref.invalidate(pembayaranListProvider);
      return null;
    } catch (e) {
      return 'Gagal: $e';
    }
  }
}

final pembayaranActionProvider =
    NotifierProvider<PembayaranActionNotifier, void>(
      () => PembayaranActionNotifier(),
    );

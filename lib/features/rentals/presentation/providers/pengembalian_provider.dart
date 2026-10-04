import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/repositories/pengembalian_repository_impl.dart';
import '../../domain/entities/pengembalian_entity.dart';
import '../../domain/repositories/pengembalian_repository.dart';

final pengembalianRepositoryProvider = Provider<PengembalianRepository>((ref) {
  return PengembalianRepositoryImpl(ref.watch(databaseProvider));
});

final penyewaanDipinjamProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final repo = ref.watch(pengembalianRepositoryProvider);
  final authState = ref.watch(authProvider);
  final user = authState is AuthAuthenticated ? authState.user : null;

  int? idOrganisasi;
  if (user?.role == 'ormawa') {
    final db = ref.watch(databaseProvider);
    final userOrg =
        await (db.select(db.userOrganisasi)
              ..where((t) => t.idUser.equals(user!.idUser))
              ..limit(1))
            .getSingleOrNull();
    idOrganisasi = userOrg?.idOrganisasi;
  }

  return repo.getPenyewaanDipinjam(idOrganisasi: idOrganisasi);
});

class PengembalianActionNotifier extends Notifier<void> {
  @override
  void build() {}

  Future<String?> proses({
    required int idSewa,
    required DateTime tanggalDikembalikan,
    required double denda,
    required String? catatan,
    required int? idAdmin,
    required List<KondisiItemInput> kondisiItems,
  }) async {
    try {
      await ref
          .read(pengembalianRepositoryProvider)
          .prosesPengembalian(
            idSewa: idSewa,
            tanggalDikembalikan: tanggalDikembalikan,
            denda: denda,
            catatan: catatan,
            idAdmin: idAdmin,
            kondisiItems: kondisiItems,
          );
      ref.invalidate(penyewaanDipinjamProvider);
      return null;
    } catch (e) {
      return 'Gagal: $e';
    }
  }
}

final pengembalianActionProvider =
    NotifierProvider<PengembalianActionNotifier, void>(
      () => PengembalianActionNotifier(),
    );

import '../entities/pengembalian_entity.dart';

abstract class PengembalianRepository {
  Future<List<Map<String, dynamic>>> getPenyewaanDipinjam({int? idOrganisasi});
  Future<List<Map<String, dynamic>>> getDetailBarang(int idSewa);
  Future<void> prosesPengembalian({
    required int idSewa,
    required DateTime tanggalDikembalikan,
    required double denda,
    required String? catatan,
    required int? idAdmin,
    required List<KondisiItemInput> kondisiItems,
  });
}

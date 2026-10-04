import '../entities/pembayaran_entity.dart';

abstract class PembayaranRepository {
  Future<List<PembayaranEntity>> getAll({int? idPeminjam, int? idOrganisasi});
  Future<int> create({
    required int idSewa,
    required String jenisPembayaran,
    required String metodePembayaran,
    required double jumlahBayar,
    String? keterangan,
    String? buktiBayar,
    int? idAdmin,
  });
  Future<void> updateStatus(int idPembayaran, String status);
  Future<List<Map<String, dynamic>>> getPenyewaanBelumLunas({int? idPeminjam});
}

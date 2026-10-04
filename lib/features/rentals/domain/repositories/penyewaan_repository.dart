import '../entities/penyewaan_entity.dart';

class CreatePenyewaanData {
  final int idPeminjam;
  final int idOrganisasi;
  final DateTime tanggalSewa;
  final DateTime tanggalRencanaKembali;
  final double dp;
  final String? catatan;
  final List<DetailItem> items;

  const CreatePenyewaanData({
    required this.idPeminjam,
    required this.idOrganisasi,
    required this.tanggalSewa,
    required this.tanggalRencanaKembali,
    required this.dp,
    this.catatan,
    required this.items,
  });
}

class DetailItem {
  final int idBarang;
  final int jumlah;
  final double hargaSatuan;

  const DetailItem({
    required this.idBarang,
    required this.jumlah,
    required this.hargaSatuan,
  });
}

abstract class PenyewaanRepository {
  Future<List<PenyewaanEntity>> getAll({
    int? idPeminjam,
    int? idOrganisasi,
    String? status,
  });
  Future<PenyewaanEntity?> getById(int id);
  Future<String> generateKodeSewa();
  Future<int> create(CreatePenyewaanData data);
  Future<void> updateStatus(int idSewa, String statusBaru);
  Future<void> softDelete(int idSewa);
}

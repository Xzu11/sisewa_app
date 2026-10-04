import '../entities/barang_entity.dart';

abstract class BarangRepository {
  Future<List<BarangEntity>> getAll({String? search, int? idKategori});
  Future<BarangEntity?> getById(int id);
  Future<int> create({
    required int idKategori,
    required int idOrganisasi,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  });
  Future<void> update({
    required int idBarang,
    required int idKategori,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  });
  Future<void> softDelete(int idBarang);
  Future<bool> isNamaTaken(String namaBarang, {int? excludeId});
  Future<int> getTotalStok();
}

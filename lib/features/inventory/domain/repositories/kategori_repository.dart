import '../entities/kategori_entity.dart';

abstract class KategoriRepository {
  Future<List<KategoriEntity>> getAll({String? search});
  Future<KategoriEntity?> getById(int id);
  Future<int> create({required String namaKategori, String? deskripsi});
  Future<void> update({
    required int idKategori,
    required String namaKategori,
    String? deskripsi,
  });
  Future<void> softDelete(int idKategori);
  Future<bool> isNamaTaken(String namaKategori, {int? excludeId});
}

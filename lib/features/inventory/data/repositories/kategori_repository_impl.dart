import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/kategori_entity.dart';
import '../../domain/repositories/kategori_repository.dart';

class KategoriRepositoryImpl implements KategoriRepository {
  final AppDatabase _db;

  KategoriRepositoryImpl(this._db);

  @override
  Future<List<KategoriEntity>> getAll({String? search}) async {
    final query = _db.select(_db.kategoriBarang)
      ..where((t) => t.statusRecord.equals('aktif'))
      ..orderBy([(t) => OrderingTerm.asc(t.namaKategori)]);

    if (search != null && search.trim().isNotEmpty) {
      query.where((t) => t.namaKategori.like('%${search.trim()}%'));
    }

    final rows = await query.get();
    return rows.map<KategoriEntity>(_toEntity).toList();
  }

  @override
  Future<KategoriEntity?> getById(int id) async {
    final row =
        await (_db.select(_db.kategoriBarang)
              ..where((t) => t.idKategori.equals(id))
              ..limit(1))
            .getSingleOrNull();
    return row == null ? null : _toEntity(row);
  }

  @override
  Future<int> create({required String namaKategori, String? deskripsi}) async {
    return await _db
        .into(_db.kategoriBarang)
        .insert(
          KategoriBarangCompanion.insert(
            namaKategori: namaKategori,
            deskripsi: Value(deskripsi),
          ),
        );
  }

  @override
  Future<void> update({
    required int idKategori,
    required String namaKategori,
    String? deskripsi,
  }) async {
    await (_db.update(
      _db.kategoriBarang,
    )..where((t) => t.idKategori.equals(idKategori))).write(
      KategoriBarangCompanion(
        namaKategori: Value(namaKategori),
        deskripsi: Value(deskripsi),
      ),
    );
  }

  @override
  Future<void> softDelete(int idKategori) async {
    await (_db.update(_db.kategoriBarang)
          ..where((t) => t.idKategori.equals(idKategori)))
        .write(const KategoriBarangCompanion(statusRecord: Value('nonaktif')));
  }

  @override
  Future<bool> isNamaTaken(String namaKategori, {int? excludeId}) async {
    final query = _db.select(_db.kategoriBarang)
      ..where((t) => t.namaKategori.equals(namaKategori))
      ..where((t) => t.statusRecord.equals('aktif'));

    if (excludeId != null) {
      query.where((t) => t.idKategori.equals(excludeId).not());
    }
    query.limit(1);

    final row = await query.getSingleOrNull();
    return row != null;
  }

  KategoriEntity _toEntity(KategoriBarangData row) => KategoriEntity(
    idKategori: row.idKategori,
    namaKategori: row.namaKategori,
    deskripsi: row.deskripsi,
    statusRecord: row.statusRecord,
  );
}

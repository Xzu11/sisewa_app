import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/barang_entity.dart';
import '../../domain/repositories/barang_repository.dart';

class BarangRepositoryImpl implements BarangRepository {
  final AppDatabase _db;

  BarangRepositoryImpl(this._db);

  @override
  Future<List<BarangEntity>> getAll({String? search, int? idKategori}) async {
    // Query join manual dengan kategori & organisasi
    final query = _db.select(_db.barang).join([
      innerJoin(
        _db.kategoriBarang,
        _db.kategoriBarang.idKategori.equalsExp(_db.barang.idKategori),
      ),
      innerJoin(
        _db.organisasi,
        _db.organisasi.idOrganisasi.equalsExp(_db.barang.idOrganisasi),
      ),
    ]);

    query.where(_db.barang.statusRecord.equals('aktif'));

    if (search != null && search.trim().isNotEmpty) {
      query.where(_db.barang.namaBarang.like('%${search.trim()}%'));
    }
    if (idKategori != null) {
      query.where(_db.barang.idKategori.equals(idKategori));
    }

    query.orderBy([OrderingTerm.asc(_db.barang.namaBarang)]);

    final rows = await query.get();

    return rows.map((row) {
      final barang = row.readTable(_db.barang);
      final kategori = row.readTable(_db.kategoriBarang);
      final organisasi = row.readTable(_db.organisasi);

      return _toEntity(
        barang,
        namaKategori: kategori.namaKategori,
        namaOrganisasi: organisasi.namaOrganisasi,
      );
    }).toList();
  }

  @override
  Future<BarangEntity?> getById(int id) async {
    final row =
        await (_db.select(_db.barang)
              ..where((t) => t.idBarang.equals(id))
              ..limit(1))
            .getSingleOrNull();

    if (row == null) return null;

    // Ambil nama kategori
    final kategori =
        await (_db.select(_db.kategoriBarang)
              ..where((t) => t.idKategori.equals(row.idKategori))
              ..limit(1))
            .getSingleOrNull();

    final organisasi =
        await (_db.select(_db.organisasi)
              ..where((t) => t.idOrganisasi.equals(row.idOrganisasi))
              ..limit(1))
            .getSingleOrNull();

    return _toEntity(
      row,
      namaKategori: kategori?.namaKategori,
      namaOrganisasi: organisasi?.namaOrganisasi,
    );
  }

  @override
  Future<int> create({
    required int idKategori,
    required int idOrganisasi,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  }) async {
    return await _db
        .into(_db.barang)
        .insert(
          BarangCompanion.insert(
            idKategori: idKategori,
            idOrganisasi: idOrganisasi,
            namaBarang: namaBarang,
            deskripsi: Value(deskripsi),
            fotoBarang: Value(fotoBarang),
            stokTotal: Value(stokTotal),
            stokTersedia: Value(stokTersedia),
            kondisi: Value(kondisi),
          ),
        );
  }

  @override
  Future<void> update({
    required int idBarang,
    required int idKategori,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  }) async {
    await (_db.update(
      _db.barang,
    )..where((t) => t.idBarang.equals(idBarang))).write(
      BarangCompanion(
        idKategori: Value(idKategori),
        namaBarang: Value(namaBarang),
        deskripsi: Value(deskripsi),
        fotoBarang: Value(fotoBarang),
        stokTotal: Value(stokTotal),
        stokTersedia: Value(stokTersedia),
        kondisi: Value(kondisi),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> softDelete(int idBarang) async {
    await (_db.update(
      _db.barang,
    )..where((t) => t.idBarang.equals(idBarang))).write(
      BarangCompanion(
        statusRecord: const Value('nonaktif'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> isNamaTaken(String namaBarang, {int? excludeId}) async {
    final query = _db.select(_db.barang)
      ..where((t) => t.namaBarang.equals(namaBarang))
      ..where((t) => t.statusRecord.equals('aktif'));

    if (excludeId != null) {
      query.where((t) => t.idBarang.equals(excludeId).not());
    }
    query.limit(1);

    final row = await query.getSingleOrNull();
    return row != null;
  }

  @override
  Future<int> getTotalStok() async {
    final query = _db.selectOnly(_db.barang)
      ..addColumns([_db.barang.stokTotal.sum()])
      ..where(_db.barang.statusRecord.equals('aktif'));

    final result = await query.getSingle();
    return result.read(_db.barang.stokTotal.sum()) ?? 0;
  }

  BarangEntity _toEntity(
    BarangData row, {
    String? namaKategori,
    String? namaOrganisasi,
  }) => BarangEntity(
    idBarang: row.idBarang,
    idKategori: row.idKategori,
    idOrganisasi: row.idOrganisasi,
    namaBarang: row.namaBarang,
    deskripsi: row.deskripsi,
    fotoBarang: row.fotoBarang,
    stokTotal: row.stokTotal,
    stokTersedia: row.stokTersedia,
    kondisi: row.kondisi,
    statusRecord: row.statusRecord,
    namaKategori: namaKategori,
    namaOrganisasi: namaOrganisasi,
  );
}

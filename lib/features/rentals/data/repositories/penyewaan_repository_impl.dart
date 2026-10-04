import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/penyewaan_entity.dart';
import '../../domain/repositories/penyewaan_repository.dart';

class PenyewaanRepositoryImpl implements PenyewaanRepository {
  final AppDatabase _db;

  PenyewaanRepositoryImpl(this._db);

  @override
  Future<List<PenyewaanEntity>> getAll({
    int? idPeminjam,
    int? idOrganisasi,
    String? status,
  }) async {
    final query = _db.select(_db.penyewaan).join([
      innerJoin(
        _db.peminjam,
        _db.peminjam.idPeminjam.equalsExp(_db.penyewaan.idPeminjam),
      ),
      innerJoin(
        _db.organisasi,
        _db.organisasi.idOrganisasi.equalsExp(_db.penyewaan.idOrganisasi),
      ),
    ]);

    if (idPeminjam != null) {
      query.where(_db.penyewaan.idPeminjam.equals(idPeminjam));
    }
    if (idOrganisasi != null) {
      query.where(_db.penyewaan.idOrganisasi.equals(idOrganisasi));
    }
    if (status != null) {
      query.where(_db.penyewaan.statusPenyewaan.equals(status));
    }

    query.orderBy([OrderingTerm.desc(_db.penyewaan.createdAt)]);

    final rows = await query.get();

    return rows.map((row) {
      final sewa = row.readTable(_db.penyewaan);
      final peminjam = row.readTable(_db.peminjam);
      final org = row.readTable(_db.organisasi);

      return PenyewaanEntity(
        idSewa: sewa.idSewa,
        kodeSewa: sewa.kodeSewa,
        idPeminjam: sewa.idPeminjam,
        idOrganisasi: sewa.idOrganisasi,
        tanggalSewa: sewa.tanggalSewa,
        tanggalRencanaKembali: sewa.tanggalRencanaKembali,
        tanggalAktualKembali: sewa.tanggalAktualKembali,
        statusPenyewaan: sewa.statusPenyewaan,
        totalHarga: sewa.totalHarga,
        dp: sewa.dp,
        sisaBayar: sewa.sisaBayar,
        catatan: sewa.catatan,
        createdAt: sewa.createdAt,
        namaPeminjam: peminjam.nim,
        nimPeminjam: peminjam.nim,
        namaOrganisasi: org.namaOrganisasi,
      );
    }).toList();
  }

  @override
  Future<PenyewaanEntity?> getById(int id) async {
    final sewa =
        await (_db.select(_db.penyewaan)
              ..where((t) => t.idSewa.equals(id))
              ..limit(1))
            .getSingleOrNull();
    if (sewa == null) return null;

    return PenyewaanEntity(
      idSewa: sewa.idSewa,
      kodeSewa: sewa.kodeSewa,
      idPeminjam: sewa.idPeminjam,
      idOrganisasi: sewa.idOrganisasi,
      tanggalSewa: sewa.tanggalSewa,
      tanggalRencanaKembali: sewa.tanggalRencanaKembali,
      tanggalAktualKembali: sewa.tanggalAktualKembali,
      statusPenyewaan: sewa.statusPenyewaan,
      totalHarga: sewa.totalHarga,
      dp: sewa.dp,
      sisaBayar: sewa.sisaBayar,
      catatan: sewa.catatan,
      createdAt: sewa.createdAt,
    );
  }

  @override
  Future<String> generateKodeSewa() async {
    final year = DateTime.now().year;
    final prefix = 'SW-$year-';

    final query = _db.selectOnly(_db.penyewaan)
      ..addColumns([_db.penyewaan.idSewa.count()])
      ..where(_db.penyewaan.kodeSewa.like('$prefix%'));

    final count = await query
        .map((r) => r.read(_db.penyewaan.idSewa.count()) ?? 0)
        .getSingle();

    final nextNumber = (count + 1).toString().padLeft(4, '0');
    return '$prefix$nextNumber';
  }

  @override
  Future<int> create(CreatePenyewaanData data) async {
    final kode = await generateKodeSewa();

    // Hitung total harga
    double total = 0;
    for (final item in data.items) {
      total += item.hargaSatuan * item.jumlah;
    }

    // Hitung hari sewa
    final days =
        data.tanggalRencanaKembali.difference(data.tanggalSewa).inDays + 1;
    total = total * (days <= 0 ? 1 : days);

    final sisaBayar = total - data.dp;

    return await _db.transaction(() async {
      // Insert penyewaan
      final idSewa = await _db
          .into(_db.penyewaan)
          .insert(
            PenyewaanCompanion.insert(
              kodeSewa: kode,
              idPeminjam: data.idPeminjam,
              idOrganisasi: data.idOrganisasi,
              tanggalSewa: data.tanggalSewa,
              tanggalRencanaKembali: data.tanggalRencanaKembali,
              statusPenyewaan: const Value('menunggu'),
              totalHarga: Value(total),
              dp: Value(data.dp),
              sisaBayar: Value(sisaBayar),
              catatan: Value(data.catatan),
            ),
          );

      // Insert detail
      for (final item in data.items) {
        final subtotal =
            item.hargaSatuan * item.jumlah * (days <= 0 ? 1 : days);
        await _db
            .into(_db.detailPenyewaan)
            .insert(
              DetailPenyewaanCompanion.insert(
                idSewa: idSewa,
                idBarang: item.idBarang,
                jumlah: Value(item.jumlah),
                hargaSatuan: item.hargaSatuan,
                subtotal: subtotal,
              ),
            );
      }

      return idSewa;
    });
  }

  @override
  Future<void> updateStatus(int idSewa, String statusBaru) async {
    await (_db.update(
      _db.penyewaan,
    )..where((t) => t.idSewa.equals(idSewa))).write(
      PenyewaanCompanion(
        statusPenyewaan: Value(statusBaru),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> softDelete(int idSewa) async {
    await (_db.update(
      _db.penyewaan,
    )..where((t) => t.idSewa.equals(idSewa))).write(
      PenyewaanCompanion(
        statusPenyewaan: const Value('ditolak'),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}

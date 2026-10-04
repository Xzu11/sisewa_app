import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/pembayaran_entity.dart';
import '../../domain/repositories/pembayaran_repository.dart';

class PembayaranRepositoryImpl implements PembayaranRepository {
  final AppDatabase _db;
  PembayaranRepositoryImpl(this._db);

  @override
  Future<List<PembayaranEntity>> getAll({
    int? idPeminjam,
    int? idOrganisasi,
  }) async {
    final q = _db.select(_db.pembayaran).join([
      innerJoin(
        _db.penyewaan,
        _db.penyewaan.idSewa.equalsExp(_db.pembayaran.idSewa),
      ),
    ]);
    if (idPeminjam != null)
      q.where(_db.penyewaan.idPeminjam.equals(idPeminjam));
    if (idOrganisasi != null)
      q.where(_db.penyewaan.idOrganisasi.equals(idOrganisasi));
    q.orderBy([OrderingTerm.desc(_db.pembayaran.tanggalBayar)]);

    final rows = await q.get();
    return rows.map((row) {
      final p = row.readTable(_db.pembayaran);
      final s = row.readTable(_db.penyewaan);
      return PembayaranEntity(
        idPembayaran: p.idPembayaran,
        idSewa: p.idSewa,
        kodeSewa: s.kodeSewa,
        jenisPembayaran: p.jenisPembayaran,
        metodePembayaran: p.metodePembayaran,
        jumlahBayar: p.jumlahBayar,
        tanggalBayar: p.tanggalBayar,
        statusPembayaran: p.statusPembayaran,
        buktiBayar: p.buktiBayar,
        keterangan: p.keterangan,
      );
    }).toList();
  }

  @override
  Future<int> create({
    required int idSewa,
    required String jenisPembayaran,
    required String metodePembayaran,
    required double jumlahBayar,
    String? keterangan,
    String? buktiBayar,
    int? idAdmin,
  }) async {
    return await _db
        .into(_db.pembayaran)
        .insert(
          PembayaranCompanion.insert(
            idSewa: idSewa,
            jenisPembayaran: jenisPembayaran,
            metodePembayaran: metodePembayaran,
            jumlahBayar: jumlahBayar,
            keterangan: Value(keterangan),
            buktiBayar: Value(buktiBayar),
            idAdmin: Value(idAdmin),
          ),
        );
  }

  @override
  Future<void> updateStatus(int idPembayaran, String status) async {
    await (_db.update(_db.pembayaran)
          ..where((t) => t.idPembayaran.equals(idPembayaran)))
        .write(PembayaranCompanion(statusPembayaran: Value(status)));
  }

  @override
  Future<List<Map<String, dynamic>>> getPenyewaanBelumLunas({
    int? idPeminjam,
  }) async {
    final q = _db.select(_db.penyewaan)
      ..where((t) => t.sisaBayar.isBiggerThanValue(0));
    if (idPeminjam != null) q.where((t) => t.idPeminjam.equals(idPeminjam));
    q.orderBy([(t) => OrderingTerm.desc(t.createdAt)]);

    final rows = await q.get();
    return rows
        .map(
          (s) => {
            'idSewa': s.idSewa,
            'kodeSewa': s.kodeSewa,
            'sisaBayar': s.sisaBayar,
            'totalHarga': s.totalHarga,
            'statusPenyewaan': s.statusPenyewaan,
          },
        )
        .toList();
  }
}

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/pengembalian_entity.dart';
import '../../domain/repositories/pengembalian_repository.dart';

class PengembalianRepositoryImpl implements PengembalianRepository {
  final AppDatabase _db;
  PengembalianRepositoryImpl(this._db);

  @override
  Future<List<Map<String, dynamic>>> getPenyewaanDipinjam({
    int? idOrganisasi,
  }) async {
    final q = _db.select(_db.penyewaan).join([
      innerJoin(
        _db.peminjam,
        _db.peminjam.idPeminjam.equalsExp(_db.penyewaan.idPeminjam),
      ),
      innerJoin(
        _db.organisasi,
        _db.organisasi.idOrganisasi.equalsExp(_db.penyewaan.idOrganisasi),
      ),
    ])..where(_db.penyewaan.statusPenyewaan.equals('dipinjam'));

    if (idOrganisasi != null) {
      q.where(_db.penyewaan.idOrganisasi.equals(idOrganisasi));
    }
    q.orderBy([OrderingTerm.asc(_db.penyewaan.tanggalRencanaKembali)]);

    final rows = await q.get();
    return rows.map((row) {
      final s = row.readTable(_db.penyewaan);
      final p = row.readTable(_db.peminjam);
      final o = row.readTable(_db.organisasi);
      return {
        'idSewa': s.idSewa,
        'kodeSewa': s.kodeSewa,
        'tanggalSewa': s.tanggalSewa,
        'tanggalRencanaKembali': s.tanggalRencanaKembali,
        'namaOrganisasi': o.namaOrganisasi,
        'nim': p.nim,
      };
    }).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getDetailBarang(int idSewa) async {
    final q = _db.select(_db.detailPenyewaan).join([
      innerJoin(
        _db.barang,
        _db.barang.idBarang.equalsExp(_db.detailPenyewaan.idBarang),
      ),
    ])..where(_db.detailPenyewaan.idSewa.equals(idSewa));

    final rows = await q.get();
    return rows.map((row) {
      final d = row.readTable(_db.detailPenyewaan);
      final b = row.readTable(_db.barang);
      return {
        'idDetail': d.idDetail,
        'idBarang': d.idBarang,
        'namaBarang': b.namaBarang,
        'jumlah': d.jumlah,
        'hargaSatuan': d.hargaSatuan,
      };
    }).toList();
  }

  @override
  Future<void> prosesPengembalian({
    required int idSewa,
    required DateTime tanggalDikembalikan,
    required double denda,
    required String? catatan,
    required int? idAdmin,
    required List<KondisiItemInput> kondisiItems,
  }) async {
    await _db.transaction(() async {
      // 1. Insert pengembalian
      final idPengembalian = await _db
          .into(_db.pengembalian)
          .insert(
            PengembalianCompanion.insert(
              idSewa: idSewa,
              tanggalDikembalikan: tanggalDikembalikan,
              statusPengembalian: const Value('diterima'),
              denda: Value(denda),
              catatan: Value(catatan),
              idAdmin: Value(idAdmin),
            ),
          );

      // 2. Insert kondisi barang & restore stok
      for (final item in kondisiItems) {
        await _db
            .into(_db.kondisiBarangKembali)
            .insert(
              KondisiBarangKembaliCompanion.insert(
                idPengembalian: idPengembalian,
                idBarang: item.idBarang,
                kondisi: item.kondisi,
                deskripsi: Value(item.deskripsi),
                biayaPerbaikan: Value(item.biayaPerbaikan),
              ),
            );

        // Kembalikan stok barang
        final barang = await (_db.select(
          _db.barang,
        )..where((t) => t.idBarang.equals(item.idBarang))).getSingle();
        await (_db.update(
          _db.barang,
        )..where((t) => t.idBarang.equals(item.idBarang))).write(
          BarangCompanion(
            stokTersedia: Value(barang.stokTersedia + item.jumlah),
            kondisi: Value(item.kondisi),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }

      // 3. Update status penyewaan
      await (_db.update(
        _db.penyewaan,
      )..where((t) => t.idSewa.equals(idSewa))).write(
        PenyewaanCompanion(
          statusPenyewaan: const Value('dikembalikan'),
          tanggalAktualKembali: Value(tanggalDikembalikan),
          updatedAt: Value(DateTime.now()),
        ),
      );
    });
  }
}

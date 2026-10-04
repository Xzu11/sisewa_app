import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

part 'app_database.g.dart';

// ============================================================
// 1. TABEL MASTER: ORGANISASI
// ============================================================
class Organisasi extends Table {
  IntColumn get idOrganisasi => integer().autoIncrement()();
  TextColumn get namaOrganisasi => text().withLength(min: 3, max: 100)();
  TextColumn get singkatan => text().withLength(min: 2, max: 20)();
  TextColumn get fakultas => text().nullable()();
  TextColumn get jurusan => text().nullable()();
  TextColumn get alamat => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get noTelepon => text().nullable()();
  TextColumn get namaKetua => text().nullable()();
  TextColumn get namaPembina => text().nullable()();
  TextColumn get logoPath => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 2. TABEL MASTER: LEVEL (level akses user)
// ============================================================
class Level extends Table {
  IntColumn get idLevel => integer().autoIncrement()();
  TextColumn get namaLevel => text().withLength(min: 3, max: 50).unique()();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get statusRecord => text().withDefault(const Constant('aktif'))();
}

// ============================================================
// 3. TABEL MASTER: USERS
// ============================================================
class Users extends Table {
  IntColumn get idUser => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 3, max: 50).unique()();
  TextColumn get passwordHash => text()();
  TextColumn get namaLengkap => text().withLength(min: 3, max: 100)();
  TextColumn get email => text().nullable()();
  TextColumn get noTelepon => text().nullable()();
  TextColumn get role => text()();
  TextColumn get status => text().withDefault(const Constant('aktif'))();
  DateTimeColumn get lastLogin => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 4. TABEL RELASI: USER_ORGANISASI
// ============================================================
@DataClassName('UserOrganisasiData')
class UserOrganisasi extends Table {
  IntColumn get idUserOrganisasi => integer().autoIncrement()();
  IntColumn get idUser => integer().references(Users, #idUser)();
  IntColumn get idOrganisasi =>
      integer().references(Organisasi, #idOrganisasi)();
  TextColumn get jabatan => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('aktif'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 5. TABEL MASTER: KATEGORI_BARANG
// ============================================================
@DataClassName('KategoriBarangData')
class KategoriBarang extends Table {
  IntColumn get idKategori => integer().autoIncrement()();
  TextColumn get namaKategori => text().withLength(min: 3, max: 100)();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get statusRecord => text().withDefault(const Constant('aktif'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 6. TABEL MASTER: BARANG
// ============================================================
class Barang extends Table {
  IntColumn get idBarang => integer().autoIncrement()();
  IntColumn get idKategori =>
      integer().references(KategoriBarang, #idKategori)();
  IntColumn get idOrganisasi =>
      integer().references(Organisasi, #idOrganisasi)();
  TextColumn get namaBarang => text().withLength(min: 3, max: 150)();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get fotoBarang => text().nullable()();
  IntColumn get stokTotal => integer().withDefault(const Constant(0))();
  IntColumn get stokTersedia => integer().withDefault(const Constant(0))();
  TextColumn get kondisi => text().withDefault(const Constant('baik'))();
  TextColumn get statusRecord => text().withDefault(const Constant('aktif'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 7. TABEL MASTER: HARGA_SEWA (harga per level pengguna)
// ============================================================
@DataClassName('HargaSewaData')
class HargaSewa extends Table {
  IntColumn get idHarga => integer().autoIncrement()();
  IntColumn get idBarang => integer().references(Barang, #idBarang)();
  IntColumn get idLevel => integer().references(Level, #idLevel)();
  RealColumn get hargaPerHari => real()();
  RealColumn get diskon => real().withDefault(const Constant(0))();
  DateTimeColumn get tanggalBerlaku =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get statusRecord => text().withDefault(const Constant('aktif'))();
}

// ============================================================
// 8. TABEL MASTER: PEMINJAM (profile peminjam)
// ============================================================
class Peminjam extends Table {
  IntColumn get idPeminjam => integer().autoIncrement()();
  IntColumn get idUser => integer().references(Users, #idUser)();
  TextColumn get nim => text().nullable()();
  TextColumn get kelas => text().nullable()();
  TextColumn get fakultas => text().nullable()();
  TextColumn get jurusan => text().nullable()();
  TextColumn get kontak => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get alamat => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('aktif'))();
}

// ============================================================
// 9. TABEL TRANSAKSI: PENYEWAAN
// ============================================================
class Penyewaan extends Table {
  IntColumn get idSewa => integer().autoIncrement()();
  TextColumn get kodeSewa => text().unique()();
  IntColumn get idPeminjam => integer().references(Peminjam, #idPeminjam)();
  IntColumn get idOrganisasi =>
      integer().references(Organisasi, #idOrganisasi)();
  DateTimeColumn get tanggalSewa => dateTime()();
  DateTimeColumn get tanggalRencanaKembali => dateTime()();
  DateTimeColumn get tanggalAktualKembali => dateTime().nullable()();
  TextColumn get statusPenyewaan =>
      text().withDefault(const Constant('menunggu'))();
  RealColumn get totalHarga => real().withDefault(const Constant(0))();
  RealColumn get dp => real().withDefault(const Constant(0))();
  RealColumn get sisaBayar => real().withDefault(const Constant(0))();
  TextColumn get catatan => text().nullable()();
  IntColumn get idAdmin => integer().nullable().references(Users, #idUser)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 10. TABEL TRANSAKSI: DETAIL_PENYEWAAN
// ============================================================
@DataClassName('DetailPenyewaanData')
class DetailPenyewaan extends Table {
  IntColumn get idDetail => integer().autoIncrement()();
  IntColumn get idSewa => integer().references(Penyewaan, #idSewa)();
  IntColumn get idBarang => integer().references(Barang, #idBarang)();
  IntColumn get jumlah => integer().withDefault(const Constant(1))();
  RealColumn get hargaSatuan => real()();
  RealColumn get subtotal => real()();
  TextColumn get kondisiSaatPinjam => text().nullable()();
  TextColumn get catatan => text().nullable()();
}

// ============================================================
// 11. TABEL TRANSAKSI: PENGEMBALIAN
// ============================================================
class Pengembalian extends Table {
  IntColumn get idPengembalian => integer().autoIncrement()();
  IntColumn get idSewa => integer().references(Penyewaan, #idSewa)();
  DateTimeColumn get tanggalDikembalikan => dateTime()();
  TextColumn get statusPengembalian =>
      text().withDefault(const Constant('diterima'))();
  RealColumn get denda => real().withDefault(const Constant(0))();
  TextColumn get catatan => text().nullable()();
  IntColumn get idAdmin => integer().nullable().references(Users, #idUser)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 12. TABEL TRANSAKSI: KONDISI_BARANG_KEMBALI
// ============================================================
@DataClassName('KondisiBarangKembaliData')
class KondisiBarangKembali extends Table {
  IntColumn get idKondisi => integer().autoIncrement()();
  IntColumn get idPengembalian =>
      integer().references(Pengembalian, #idPengembalian)();
  IntColumn get idBarang => integer().references(Barang, #idBarang)();
  TextColumn get kondisi => text()();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get fotoBukti => text().nullable()();
  RealColumn get biayaPerbaikan => real().withDefault(const Constant(0))();
}

// ============================================================
// 13. TABEL TRANSAKSI: PEMBAYARAN
// ============================================================
class Pembayaran extends Table {
  IntColumn get idPembayaran => integer().autoIncrement()();
  IntColumn get idSewa => integer().references(Penyewaan, #idSewa)();
  TextColumn get jenisPembayaran => text()();
  TextColumn get metodePembayaran => text()();
  RealColumn get jumlahBayar => real()();
  DateTimeColumn get tanggalBayar =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get statusPembayaran =>
      text().withDefault(const Constant('pending'))();
  TextColumn get buktiBayar => text().nullable()();
  TextColumn get keterangan => text().nullable()();
  IntColumn get idAdmin => integer().nullable().references(Users, #idUser)();
}

// ============================================================
// 14. TABEL PENDUKUNG: DOKUMEN_PENDUKUNG
// ============================================================
@DataClassName('DokumenPendukungData')
class DokumenPendukung extends Table {
  IntColumn get idDokumen => integer().autoIncrement()();
  IntColumn get idSewa => integer().references(Penyewaan, #idSewa)();
  TextColumn get jenisDokumen => text()();
  TextColumn get namaFile => text()();
  TextColumn get pathFile => text()();
  DateTimeColumn get tanggalUpload =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get statusVerifikasi =>
      text().withDefault(const Constant('pending'))();
}

// ============================================================
// 15. TABEL PENDUKUNG: NOTIFIKASI
// ============================================================
class Notifikasi extends Table {
  IntColumn get idNotifikasi => integer().autoIncrement()();
  IntColumn get idUser => integer().references(Users, #idUser)();
  TextColumn get judul => text()();
  TextColumn get pesan => text()();
  TextColumn get jenis => text().withDefault(const Constant('info'))();
  TextColumn get statusBaca => text().withDefault(const Constant('belum'))();
  TextColumn get link => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 16. TABEL PENDUKUNG: RIWAYAT_STATUS
// ============================================================
@DataClassName('RiwayatStatusData')
class RiwayatStatus extends Table {
  IntColumn get idRiwayat => integer().autoIncrement()();
  IntColumn get idSewa => integer().references(Penyewaan, #idSewa)();
  TextColumn get statusLama => text().nullable()();
  TextColumn get statusBaru => text()();
  TextColumn get keterangan => text().nullable()();
  IntColumn get idUser => integer().nullable().references(Users, #idUser)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// 17. TABEL PENDUKUNG: LOG_AKTIVITAS
// ============================================================
@DataClassName('LogAktivitasData')
class LogAktivitas extends Table {
  IntColumn get idLog => integer().autoIncrement()();
  IntColumn get idUser => integer().nullable().references(Users, #idUser)();
  TextColumn get aktivitas => text()();
  TextColumn get modul => text().nullable()();
  TextColumn get deskripsi => text().nullable()();
  TextColumn get ipAddress => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================================
// DATABASE UTAMA
// ============================================================
@DriftDatabase(
  tables: [
    Organisasi,
    Level,
    Users,
    UserOrganisasi,
    KategoriBarang,
    Barang,
    HargaSewa,
    Peminjam,
    Penyewaan,
    DetailPenyewaan,
    Pengembalian,
    KondisiBarangKembali,
    Pembayaran,
    DokumenPendukung,
    Notifikasi,
    RiwayatStatus,
    LogAktivitas,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ==== SEED DATA DEFAULT ====
  Future<void> seedDefaultData() async {
    final userCount = await users.count().getSingle();
    if (userCount > 0) return;

    // 1. Seed Level
    await batch((b) {
      b.insertAll(level, [
        LevelCompanion.insert(
          namaLevel: 'admin_ormawa',
          deskripsi: const Value('Admin pengelola ormawa'),
        ),
        LevelCompanion.insert(
          namaLevel: 'admin_siswa',
          deskripsi: const Value('Admin tingkat fakultas/siswa'),
        ),
        LevelCompanion.insert(
          namaLevel: 'penyewa',
          deskripsi: const Value('Penyewa barang'),
        ),
      ]);
    });

    // 2. Seed Admin default
    await into(users).insert(
      UsersCompanion.insert(
        username: 'admin',
        passwordHash: 'admin123',
        namaLengkap: 'Administrator SISEWA',
        role: 'admin_ormawa',
      ),
    );

    // 3. Seed Kategori Barang
    await batch((b) {
      b.insertAll(kategoriBarang, [
        KategoriBarangCompanion.insert(namaKategori: 'Elektronik'),
        KategoriBarangCompanion.insert(namaKategori: 'Tenda & Camping'),
        KategoriBarangCompanion.insert(namaKategori: 'Sound System'),
        KategoriBarangCompanion.insert(namaKategori: 'Alat Masak'),
        KategoriBarangCompanion.insert(namaKategori: 'Lainnya'),
      ]);
    });

    // 4. Seed Organisasi contoh
    await into(organisasi).insert(
      OrganisasiCompanion.insert(
        namaOrganisasi: 'Badan Eksekutif Mahasiswa',
        singkatan: 'BEM',
        fakultas: const Value('Teknik'),
      ),
    );
  }
}

// ============================================================
// KONEKSI DATABASE
// ============================================================
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'sisewa.sqlite'));
    debugPrint('📁 Folder dokumen: ${dbFolder.path}');
    debugPrint('💾 Path database: ${file.path}');
    debugPrint('📄 Database exists: ${await file.exists()}');
    return NativeDatabase.createInBackground(file);
  });
}

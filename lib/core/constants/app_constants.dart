class AppConstants {
  AppConstants._();

  // ===== APP INFO =====
  static const String appName = 'SISEWA';
  static const String appFullName = 'Sistem Informasi Penyewaan Barang Ormawa';
  static const String appVersion = '1.0.0';
  static const String appTagline =
      'Kelola penyewaan barang ormawa dengan mudah';

  // ===== USER ROLES =====
  static const String roleAdmin = 'admin'; // Admin sistem
  static const String roleOrmawa = 'ormawa'; // Penyedia barang
  static const String rolePenyewa = 'penyewa'; // Peminjam

  // Legacy (untuk kompatibilitas)
  static const String roleAdminOrmawa = 'admin_ormawa';
  static const String roleAdminSiswa = 'admin_siswa';

  // Email domain kampus
  static const String emailDomain = '@student.upnjatim.ac.id';

  // ===== STATUS UMUM =====
  static const String statusAktif = 'aktif';
  static const String statusNonaktif = 'nonaktif';

  // ===== STATUS PENYEWAAN =====
  static const String statusMenunggu = 'menunggu';
  static const String statusDisetujui = 'disetujui';
  static const String statusDitolak = 'ditolak';
  static const String statusDipinjam = 'dipinjam';
  static const String statusDikembalikan = 'dikembalikan';
  static const String statusTerlambat = 'terlambat';

  // ===== STATUS PEMBAYARAN =====
  static const String statusPending = 'pending';
  static const String statusLunas = 'lunas';
  static const String statusGagal = 'gagal';

  // ===== KONDISI BARANG =====
  static const String kondisiBaik = 'baik';
  static const String kondisiRusakRingan = 'rusak_ringan';
  static const String kondisiRusakBerat = 'rusak_berat';
  static const String kondisiHilang = 'hilang';
}

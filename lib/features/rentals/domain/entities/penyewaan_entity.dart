class PenyewaanEntity {
  final int idSewa;
  final String kodeSewa;
  final int idPeminjam;
  final int idOrganisasi;
  final DateTime tanggalSewa;
  final DateTime tanggalRencanaKembali;
  final DateTime? tanggalAktualKembali;
  final String statusPenyewaan;
  final double totalHarga;
  final double dp;
  final double sisaBayar;
  final String? catatan;
  final DateTime createdAt;

  // Join field
  final String? namaPeminjam;
  final String? nimPeminjam;
  final String? namaOrganisasi;
  final int jumlahItem;

  const PenyewaanEntity({
    required this.idSewa,
    required this.kodeSewa,
    required this.idPeminjam,
    required this.idOrganisasi,
    required this.tanggalSewa,
    required this.tanggalRencanaKembali,
    this.tanggalAktualKembali,
    required this.statusPenyewaan,
    required this.totalHarga,
    required this.dp,
    required this.sisaBayar,
    this.catatan,
    required this.createdAt,
    this.namaPeminjam,
    this.nimPeminjam,
    this.namaOrganisasi,
    this.jumlahItem = 0,
  });

  String get statusLabel {
    switch (statusPenyewaan) {
      case 'menunggu':
        return 'Menunggu';
      case 'disetujui':
        return 'Disetujui';
      case 'ditolak':
        return 'Ditolak';
      case 'dipinjam':
        return 'Dipinjam';
      case 'dikembalikan':
        return 'Dikembalikan';
      case 'terlambat':
        return 'Terlambat';
      default:
        return statusPenyewaan;
    }
  }

  bool get isAktif =>
      statusPenyewaan == 'dipinjam' || statusPenyewaan == 'disetujui';
}

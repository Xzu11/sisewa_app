class PembayaranEntity {
  final int idPembayaran;
  final int idSewa;
  final String kodeSewa;
  final String jenisPembayaran;
  final String metodePembayaran;
  final double jumlahBayar;
  final DateTime tanggalBayar;
  final String statusPembayaran;
  final String? buktiBayar;
  final String? keterangan;
  final String? namaPeminjam;

  const PembayaranEntity({
    required this.idPembayaran,
    required this.idSewa,
    required this.kodeSewa,
    required this.jenisPembayaran,
    required this.metodePembayaran,
    required this.jumlahBayar,
    required this.tanggalBayar,
    required this.statusPembayaran,
    this.buktiBayar,
    this.keterangan,
    this.namaPeminjam,
  });

  String get statusLabel {
    switch (statusPembayaran) {
      case 'pending':
        return 'Menunggu Verifikasi';
      case 'lunas':
        return 'Lunas';
      case 'gagal':
        return 'Gagal';
      default:
        return statusPembayaran;
    }
  }
}

class KondisiItemInput {
  final int idBarang;
  final String namaBarang;
  final int jumlah;
  final String kondisi;
  final String? deskripsi;
  final double biayaPerbaikan;

  const KondisiItemInput({
    required this.idBarang,
    required this.namaBarang,
    required this.jumlah,
    required this.kondisi,
    this.deskripsi,
    this.biayaPerbaikan = 0,
  });
}

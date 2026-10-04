class KategoriEntity {
  final int idKategori;
  final String namaKategori;
  final String? deskripsi;
  final String statusRecord;

  const KategoriEntity({
    required this.idKategori,
    required this.namaKategori,
    this.deskripsi,
    required this.statusRecord,
  });

  bool get isAktif => statusRecord == 'aktif';
}

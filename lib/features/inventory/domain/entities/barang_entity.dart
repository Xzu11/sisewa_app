class BarangEntity {
  final int idBarang;
  final int idKategori;
  final int idOrganisasi;
  final String namaBarang;
  final String? deskripsi;
  final String? fotoBarang;
  final int stokTotal;
  final int stokTersedia;
  final String kondisi;
  final String statusRecord;

  // Field bonus (dari join)
  final String? namaKategori;
  final String? namaOrganisasi;

  const BarangEntity({
    required this.idBarang,
    required this.idKategori,
    required this.idOrganisasi,
    required this.namaBarang,
    this.deskripsi,
    this.fotoBarang,
    required this.stokTotal,
    required this.stokTersedia,
    required this.kondisi,
    required this.statusRecord,
    this.namaKategori,
    this.namaOrganisasi,
  });

  bool get isAktif => statusRecord == 'aktif';
  int get stokDipinjam => stokTotal - stokTersedia;
  bool get stokHabis => stokTersedia <= 0;

  String get kondisiLabel {
    switch (kondisi) {
      case 'baik':
        return 'Baik';
      case 'rusak_ringan':
        return 'Rusak Ringan';
      case 'rusak_berat':
        return 'Rusak Berat';
      default:
        return kondisi;
    }
  }
}

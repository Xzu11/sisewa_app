class ProfileEntity {
  // Dari tabel Users
  final int idUser;
  final String username;
  final String namaLengkap;
  final String? email;
  final String? noTelepon;
  final String role;
  final String status;
  final DateTime? lastLogin;
  final DateTime createdAt;

  // Dari tabel Peminjam (kalau role = penyewa)
  final int? idPeminjam;
  final String? nim;
  final String? kelas;
  final String? fakultas;
  final String? jurusan;
  final String? alamat;

  // Dari tabel Organisasi + UserOrganisasi (kalau role = admin_ormawa)
  final int? idOrganisasi;
  final String? namaOrganisasi;
  final String? singkatanOrganisasi;
  final String? namaKetua;
  final String? namaPembina;
  final String? jabatan;

  const ProfileEntity({
    required this.idUser,
    required this.username,
    required this.namaLengkap,
    this.email,
    this.noTelepon,
    required this.role,
    required this.status,
    this.lastLogin,
    required this.createdAt,
    this.idPeminjam,
    this.nim,
    this.kelas,
    this.fakultas,
    this.jurusan,
    this.alamat,
    this.idOrganisasi,
    this.namaOrganisasi,
    this.singkatanOrganisasi,
    this.namaKetua,
    this.namaPembina,
    this.jabatan,
  });

  bool get isAdminOrmawa => role == 'admin_ormawa';
  bool get isPenyewa => role == 'penyewa';

  String get roleLabel {
    switch (role) {
      case 'admin_ormawa':
        return 'Admin Ormawa';
      case 'admin_siswa':
        return 'Admin Siswa';
      case 'penyewa':
        return 'Penyewa';
      default:
        return role;
    }
  }
}

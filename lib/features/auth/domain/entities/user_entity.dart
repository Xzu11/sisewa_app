class UserEntity {
  final int idUser;
  final String username;
  final String namaLengkap;
  final String? email;
  final String? noTelepon;
  final String role;
  final String status;

  const UserEntity({
    required this.idUser,
    required this.username,
    required this.namaLengkap,
    this.email,
    this.noTelepon,
    required this.role,
    required this.status,
  });

  bool get isAdmin => role == 'admin';
  bool get isOrmawa => role == 'ormawa';
  bool get isPenyewa => role == 'penyewa';

  // Legacy (untuk backward compat)
  bool get isAdminOrmawa => role == 'admin_ormawa' || role == 'ormawa';
  bool get isAdminSiswa => role == 'admin_siswa';
}

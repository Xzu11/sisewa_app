import '../entities/user_entity.dart';

/// Data yang dibutuhkan untuk registrasi
class RegisterData {
  final String username;
  final String password;
  final String namaLengkap;
  final String email;
  final String noTelepon;
  final String role; // 'penyewa' atau 'admin_ormawa'

  // Khusus penyewa
  final String? nim;
  final String? kelas;
  final String? fakultas;
  final String? jurusan;

  // Khusus admin ormawa
  final String? namaOrganisasi;
  final String? singkatanOrganisasi;

  const RegisterData({
    required this.username,
    required this.password,
    required this.namaLengkap,
    required this.email,
    required this.noTelepon,
    required this.role,
    this.nim,
    this.kelas,
    this.fakultas,
    this.jurusan,
    this.namaOrganisasi,
    this.singkatanOrganisasi,
  });
}

abstract class AuthRepository {
  Future<UserEntity?> login(String username, String password);
  Future<UserEntity> register(RegisterData data);
  Future<bool> isUsernameTaken(String username);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
}

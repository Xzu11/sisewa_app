import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity?> getProfile(int idUser);

  Future<void> updateBasicInfo({
    required int idUser,
    required String namaLengkap,
    String? email,
    String? noTelepon,
  });

  Future<void> updatePeminjamInfo({
    required int idPeminjam,
    required String nim,
    String? kelas,
    String? fakultas,
    String? jurusan,
    String? alamat,
  });

  Future<void> updateOrganisasiInfo({
    required int idOrganisasi,
    required String namaOrganisasi,
    required String singkatan,
    String? fakultas,
    String? jurusan,
    String? alamat,
    String? email,
    String? noTelepon,
    String? namaKetua,
    String? namaPembina,
  });

  Future<bool> changePassword({
    required int idUser,
    required String currentPassword,
    required String newPassword,
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import 'auth_provider.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.watch(databaseProvider));
});

/// Provider yang otomatis ambil profile user yang sedang login
final profileProvider = FutureProvider<ProfileEntity?>((ref) async {
  final authState = ref.watch(authProvider);
  if (authState is! AuthAuthenticated) return null;

  final repo = ref.watch(profileRepositoryProvider);
  return repo.getProfile(authState.user.idUser);
});

/// Notifier untuk aksi update profile
class ProfileActionNotifier extends Notifier<void> {
  ProfileRepository get _repo => ref.read(profileRepositoryProvider);

  @override
  void build() {}

  Future<bool> updateBasicInfo({
    required int idUser,
    required String namaLengkap,
    String? email,
    String? noTelepon,
  }) async {
    try {
      await _repo.updateBasicInfo(
        idUser: idUser,
        namaLengkap: namaLengkap,
        email: email,
        noTelepon: noTelepon,
      );
      ref.invalidate(profileProvider);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePeminjamInfo({
    required int idPeminjam,
    required String nim,
    String? kelas,
    String? fakultas,
    String? jurusan,
    String? alamat,
  }) async {
    try {
      await _repo.updatePeminjamInfo(
        idPeminjam: idPeminjam,
        nim: nim,
        kelas: kelas,
        fakultas: fakultas,
        jurusan: jurusan,
        alamat: alamat,
      );
      ref.invalidate(profileProvider);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateOrganisasiInfo({
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
  }) async {
    try {
      await _repo.updateOrganisasiInfo(
        idOrganisasi: idOrganisasi,
        namaOrganisasi: namaOrganisasi,
        singkatan: singkatan,
        fakultas: fakultas,
        jurusan: jurusan,
        alamat: alamat,
        email: email,
        noTelepon: noTelepon,
        namaKetua: namaKetua,
        namaPembina: namaPembina,
      );
      ref.invalidate(profileProvider);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String?> changePassword({
    required int idUser,
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final ok = await _repo.changePassword(
        idUser: idUser,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      if (!ok) return 'Password saat ini salah';
      return null;
    } catch (e) {
      return 'Gagal mengubah password: $e';
    }
  }
}

final profileActionProvider = NotifierProvider<ProfileActionNotifier, void>(
  () => ProfileActionNotifier(),
);

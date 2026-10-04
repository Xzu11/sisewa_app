import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AppDatabase _db;

  ProfileRepositoryImpl(this._db);

  @override
  Future<ProfileEntity?> getProfile(int idUser) async {
    // 1. Ambil data user
    final user =
        await (_db.select(_db.users)
              ..where((t) => t.idUser.equals(idUser))
              ..limit(1))
            .getSingleOrNull();
    if (user == null) return null;

    // 2. Ambil data peminjam (kalau ada)
    final peminjam =
        await (_db.select(_db.peminjam)
              ..where((t) => t.idUser.equals(idUser))
              ..limit(1))
            .getSingleOrNull();

    // 3. Ambil data organisasi (kalau ada)
    OrganisasiData? organisasi;
    UserOrganisasiData? userOrg;

    userOrg =
        await (_db.select(_db.userOrganisasi)
              ..where((t) => t.idUser.equals(idUser))
              ..limit(1))
            .getSingleOrNull();

    if (userOrg != null) {
      organisasi =
          await (_db.select(_db.organisasi)
                ..where((t) => t.idOrganisasi.equals(userOrg!.idOrganisasi))
                ..limit(1))
              .getSingleOrNull();
    }

    return ProfileEntity(
      idUser: user.idUser,
      username: user.username,
      namaLengkap: user.namaLengkap,
      email: user.email,
      noTelepon: user.noTelepon,
      role: user.role,
      status: user.status,
      lastLogin: user.lastLogin,
      createdAt: user.createdAt,
      // Peminjam
      idPeminjam: peminjam?.idPeminjam,
      nim: peminjam?.nim,
      kelas: peminjam?.kelas,
      fakultas: peminjam?.fakultas,
      jurusan: peminjam?.jurusan,
      alamat: peminjam?.alamat,
      // Organisasi
      idOrganisasi: organisasi?.idOrganisasi,
      namaOrganisasi: organisasi?.namaOrganisasi,
      singkatanOrganisasi: organisasi?.singkatan,
      namaKetua: organisasi?.namaKetua,
      namaPembina: organisasi?.namaPembina,
      jabatan: userOrg?.jabatan,
    );
  }

  @override
  Future<void> updateBasicInfo({
    required int idUser,
    required String namaLengkap,
    String? email,
    String? noTelepon,
  }) async {
    await (_db.update(_db.users)..where((t) => t.idUser.equals(idUser))).write(
      UsersCompanion(
        namaLengkap: Value(namaLengkap),
        email: Value(email),
        noTelepon: Value(noTelepon),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> updatePeminjamInfo({
    required int idPeminjam,
    required String nim,
    String? kelas,
    String? fakultas,
    String? jurusan,
    String? alamat,
  }) async {
    await (_db.update(
      _db.peminjam,
    )..where((t) => t.idPeminjam.equals(idPeminjam))).write(
      PeminjamCompanion(
        nim: Value(nim),
        kelas: Value(kelas),
        fakultas: Value(fakultas),
        jurusan: Value(jurusan),
        alamat: Value(alamat),
      ),
    );
  }

  @override
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
  }) async {
    await (_db.update(
      _db.organisasi,
    )..where((t) => t.idOrganisasi.equals(idOrganisasi))).write(
      OrganisasiCompanion(
        namaOrganisasi: Value(namaOrganisasi),
        singkatan: Value(singkatan),
        fakultas: Value(fakultas),
        jurusan: Value(jurusan),
        alamat: Value(alamat),
        email: Value(email),
        noTelepon: Value(noTelepon),
        namaKetua: Value(namaKetua),
        namaPembina: Value(namaPembina),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<bool> changePassword({
    required int idUser,
    required String currentPassword,
    required String newPassword,
  }) async {
    // Cek password lama
    final user =
        await (_db.select(_db.users)
              ..where((t) => t.idUser.equals(idUser))
              ..limit(1))
            .getSingleOrNull();

    if (user == null) return false;
    if (user.passwordHash != currentPassword) return false;

    // Update password baru
    await (_db.update(_db.users)..where((t) => t.idUser.equals(idUser))).write(
      UsersCompanion(
        passwordHash: Value(newPassword),
        updatedAt: Value(DateTime.now()),
      ),
    );
    return true;
  }
}

import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AppDatabase _db;
  static const _keyUserId = 'current_user_id';

  AuthRepositoryImpl(this._db);

  // ============ LOGIN ============
  @override
  Future<UserEntity?> login(String username, String password) async {
    final query = _db.select(_db.users)
      ..where((t) => t.username.equals(username))
      ..where((t) => t.passwordHash.equals(password))
      ..where((t) => t.status.equals('aktif'))
      ..limit(1);

    final user = await query.getSingleOrNull();
    if (user == null) return null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyUserId, user.idUser);

    await (_db.update(_db.users)..where((t) => t.idUser.equals(user.idUser)))
        .write(UsersCompanion(lastLogin: Value(DateTime.now())));

    return _toEntity(user);
  }

  // ============ CEK USERNAME ============
  @override
  Future<bool> isUsernameTaken(String username) async {
    final query = _db.select(_db.users)
      ..where((t) => t.username.equals(username))
      ..limit(1);
    final result = await query.getSingleOrNull();
    return result != null;
  }

  // ============ REGISTER ============
  @override
  Future<UserEntity> register(RegisterData data) async {
    // Validasi domain email kampus
    final email = data.email.trim().toLowerCase();
    if (!email.endsWith('@student.upnjatim.ac.id')) {
      throw Exception('Email wajib menggunakan domain @student.upnjatim.ac.id');
    }
    // Cek username dulu
    if (await isUsernameTaken(data.username)) {
      throw Exception('Username "${data.username}" sudah digunakan');
    }

    // Jalankan dalam transaction supaya kalau gagal, semua rollback
    return await _db.transaction(() async {
      // 1. Insert User
      final userId = await _db
          .into(_db.users)
          .insert(
            UsersCompanion.insert(
              username: data.username,
              passwordHash: data.password, // TODO: hash pakai bcrypt
              namaLengkap: data.namaLengkap,
              email: Value(data.email),
              noTelepon: Value(data.noTelepon),
              role: data.role,
            ),
          );

      // 2. Kalau role penyewa → buat Peminjam
      if (data.role == AppConstants.rolePenyewa) {
        await _db
            .into(_db.peminjam)
            .insert(
              PeminjamCompanion.insert(
                idUser: userId,
                nim: Value(data.nim ?? ''),
                kelas: Value(data.kelas ?? ''),
                fakultas: Value(data.fakultas ?? ''),
                jurusan: Value(data.jurusan ?? ''),
                email: Value(data.email),
                kontak: Value(data.noTelepon),
              ),
            );
      }

      // 3. Kalau role admin_ormawa → buat Organisasi + UserOrganisasi
      if (data.role == AppConstants.roleOrmawa &&
          data.namaOrganisasi != null &&
          data.singkatanOrganisasi != null) {
        final orgId = await _db
            .into(_db.organisasi)
            .insert(
              OrganisasiCompanion.insert(
                namaOrganisasi: data.namaOrganisasi!,
                singkatan: data.singkatanOrganisasi!,
                fakultas: Value(data.fakultas ?? ''),
                jurusan: Value(data.jurusan ?? ''),
                email: Value(data.email),
                noTelepon: Value(data.noTelepon),
                namaKetua: Value(data.namaLengkap),
              ),
            );

        await _db
            .into(_db.userOrganisasi)
            .insert(
              UserOrganisasiCompanion.insert(
                idUser: userId,
                idOrganisasi: orgId,
                jabatan: const Value('ketua'),
              ),
            );
      }

      // 4. Ambil user yang baru dibuat
      final newUser = await (_db.select(
        _db.users,
      )..where((t) => t.idUser.equals(userId))).getSingle();

      return _toEntity(newUser);
    });
  }

  // ============ LOGOUT ============
  @override
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
  }

  // ============ GET CURRENT USER ============
  @override
  Future<UserEntity?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt(_keyUserId);
    if (idUser == null) return null;

    final user =
        await (_db.select(_db.users)
              ..where((t) => t.idUser.equals(idUser))
              ..limit(1))
            .getSingleOrNull();

    return user == null ? null : _toEntity(user);
  }

  UserEntity _toEntity(User user) => UserEntity(
    idUser: user.idUser,
    username: user.username,
    namaLengkap: user.namaLengkap,
    email: user.email,
    noTelepon: user.noTelepon,
    role: user.role,
    status: user.status,
  );
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

// ============================================================
// REPOSITORY PROVIDER
// ============================================================
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(databaseProvider));
});

// ============================================================
// AUTH STATE (sealed class)
// ============================================================
sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final UserEntity user;
  const AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);
}

// ============================================================
// AUTH NOTIFIER (Riverpod 3.x)
// ============================================================
class AuthNotifier extends Notifier<AuthState> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  AuthState build() {
    return const AuthInitial();
  }

  Future<bool> login(String username, String password) async {
    state = const AuthLoading();
    try {
      final user = await _repo.login(username, password);
      if (user == null) {
        state = const AuthError('Username atau password salah');
        return false;
      }
      state = AuthAuthenticated(user);
      return true;
    } catch (e) {
      state = AuthError('Terjadi kesalahan: $e');
      return false;
    }
  }

  Future<bool> register(RegisterData data) async {
    state = const AuthLoading();
    try {
      final user = await _repo.register(data);
      state = AuthAuthenticated(user);
      return true;
    } on Exception catch (e) {
      state = AuthError(e.toString().replaceFirst('Exception: ', ''));
      return false;
    } catch (e) {
      state = AuthError('Terjadi kesalahan: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _repo.logout();
    state = const AuthUnauthenticated();
  }

  Future<void> checkSession() async {
    state = const AuthLoading();
    final user = await _repo.getCurrentUser();
    state = user != null
        ? AuthAuthenticated(user)
        : const AuthUnauthenticated();
  }
}

// ============================================================
// PROVIDER
// ============================================================
final authProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});

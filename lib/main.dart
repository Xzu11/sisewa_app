import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/database/app_database.dart';
import 'core/database/database_provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';
import 'features/dashboard/presentation/screens/main_shell.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  // Inisialisasi database
  final db = AppDatabase();
  await db.seedDefaultData();
  debugPrint('✅ Database SISEWA siap digunakan!');

  runApp(
    ProviderScope(
      overrides: [databaseProvider.overrideWithValue(db)],
      child: const SisewaApp(),
    ),
  );
}

class SisewaApp extends ConsumerStatefulWidget {
  const SisewaApp({super.key});

  @override
  ConsumerState<SisewaApp> createState() => _SisewaAppState();
}

class _SisewaAppState extends ConsumerState<SisewaApp> {
  @override
  void initState() {
    super.initState();
    // Cek session login yang tersimpan
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authProvider.notifier).checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return MaterialApp(
      title: 'SISEWA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: _buildHome(authState),
    );
  }

  Widget _buildHome(AuthState state) {
    return switch (state) {
      AuthInitial() => const _SplashScreen(),
      AuthLoading() => const _SplashScreen(),
      AuthAuthenticated() => const MainShell(), // ← Ubah dari DashboardScreen
      AuthUnauthenticated() => const LoginScreen(),
      AuthError() => const LoginScreen(),
    };
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inventory_2_rounded, size: 64, color: AppColors.primary),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

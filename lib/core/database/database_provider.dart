import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';

/// Provider global untuk mengakses AppDatabase dari seluruh aplikasi.
/// Nilai asli akan di-override di `main.dart` saat inisialisasi.
final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError(
    'databaseProvider belum di-override. '
    'Pastikan sudah dioverride di main.dart dengan ProviderScope.overrides.',
  );
});

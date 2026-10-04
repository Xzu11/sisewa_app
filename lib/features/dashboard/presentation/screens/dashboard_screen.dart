import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class DashboardStats {
  final int totalBarang;
  final int sedangDipinjam;
  final int menungguApproval;
  final int terlambat;
  final int totalKategori;
  final int totalOrmawa;
  final int totalPenyewa;
  final int totalPenyewaan;

  const DashboardStats({
    required this.totalBarang,
    required this.sedangDipinjam,
    required this.menungguApproval,
    required this.terlambat,
    required this.totalKategori,
    required this.totalOrmawa,
    required this.totalPenyewa,
    required this.totalPenyewaan,
  });
}

final dashboardStatsProvider = FutureProvider<DashboardStats>((ref) async {
  final db = ref.watch(databaseProvider);
  final authState = ref.watch(authProvider);
  final user = authState is AuthAuthenticated ? authState.user : null;
  final isPenyewa = user?.role == 'penyewa';

  // ============ HELPER: hitung via get() + length ============
  Future<int> countBarang({bool onlyAktif = false}) async {
    final q = db.select(db.barang);
    if (onlyAktif) {
      q.where((t) => t.statusRecord.equals('aktif'));
    }
    return (await q.get()).length;
  }

  Future<int> countPenyewaan({String? status}) async {
    final q = db.select(db.penyewaan);
    if (status != null) {
      q.where((t) => t.statusPenyewaan.equals(status));
    }
    return (await q.get()).length;
  }

  Future<int> countKategori() async {
    final q = db.select(db.kategoriBarang)
      ..where((t) => t.statusRecord.equals('aktif'));
    return (await q.get()).length;
  }

  Future<int> countUsersByRole(String role) async {
    final q = db.select(db.users)..where((t) => t.role.equals(role));
    return (await q.get()).length;
  }

  // ============ PENYEWA: hanya butuh total barang ============
  if (isPenyewa) {
    final totalBarang = await countBarang(onlyAktif: true);
    return DashboardStats(
      totalBarang: totalBarang,
      sedangDipinjam: 0,
      menungguApproval: 0,
      terlambat: 0,
      totalKategori: 0,
      totalOrmawa: 0,
      totalPenyewa: 0,
      totalPenyewaan: 0,
    );
  }

  // ============ ADMIN / ORMAWA ============
  final totalBarang = await countBarang(onlyAktif: true);
  final totalPenyewaan = await countPenyewaan();
  final sedangDipinjam = await countPenyewaan(status: 'dipinjam');
  final menungguApproval = await countPenyewaan(status: 'menunggu');

  // Terlambat: hitung di Dart
  final now = DateTime.now();
  final dipinjamList = await (db.select(
    db.penyewaan,
  )..where((t) => t.statusPenyewaan.equals('dipinjam'))).get();
  final terlambat = dipinjamList
      .where((p) => p.tanggalRencanaKembali.isBefore(now))
      .length;

  final totalKategori = await countKategori();
  final totalOrmawa = await countUsersByRole('ormawa');
  final totalPenyewa = await countUsersByRole('penyewa');

  return DashboardStats(
    totalBarang: totalBarang,
    sedangDipinjam: sedangDipinjam,
    menungguApproval: menungguApproval,
    terlambat: terlambat,
    totalKategori: totalKategori,
    totalOrmawa: totalOrmawa,
    totalPenyewa: totalPenyewa,
    totalPenyewaan: totalPenyewaan,
  );
});

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final isPenyewa = user?.role == 'penyewa';
    final statsAsync = ref.watch(dashboardStatsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, ${user?.namaLengkap ?? "Pengguna"} 👋',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 4),
          Text(
            isPenyewa
                ? 'Temukan barang yang Anda butuhkan di katalog'
                : 'Ringkasan aktivitas SISEWA hari ini',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          statsAsync.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (stats) {
              if (isPenyewa) {
                return _buildPenyewaDashboard(context, stats);
              }
              return _buildAdminDashboard(context, stats);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAdminDashboard(BuildContext context, DashboardStats stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final crossCount = constraints.maxWidth > 900 ? 4 : 2;
            return GridView.count(
              crossAxisCount: crossCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.0,
              children: [
                _StatCard(
                  title: 'Total Barang',
                  value: '${stats.totalBarang}',
                  icon: Icons.inventory_2_outlined,
                  color: AppColors.primary,
                ),
                _StatCard(
                  title: 'Sedang Dipinjam',
                  value: '${stats.sedangDipinjam}',
                  icon: Icons.assignment_outlined,
                  color: AppColors.warning,
                ),
                _StatCard(
                  title: 'Menunggu Approval',
                  value: '${stats.menungguApproval}',
                  icon: Icons.hourglass_empty_rounded,
                  color: AppColors.info,
                ),
                _StatCard(
                  title: 'Terlambat',
                  value: '${stats.terlambat}',
                  icon: Icons.warning_amber_rounded,
                  color: AppColors.error,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossCount = constraints.maxWidth > 900 ? 4 : 2;
            return GridView.count(
              crossAxisCount: crossCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.4,
              children: [
                _MiniStatCard(
                  title: 'Total Kategori',
                  value: '${stats.totalKategori}',
                  icon: Icons.category_outlined,
                ),
                _MiniStatCard(
                  title: 'Total Ormawa',
                  value: '${stats.totalOrmawa}',
                  icon: Icons.storefront_outlined,
                ),
                _MiniStatCard(
                  title: 'Total Penyewa',
                  value: '${stats.totalPenyewa}',
                  icon: Icons.people_outline,
                ),
                _MiniStatCard(
                  title: 'Total Penyewaan',
                  value: '${stats.totalPenyewaan}',
                  icon: Icons.receipt_long_outlined,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildPenyewaDashboard(BuildContext context, DashboardStats stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primarySurface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.storefront_outlined,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${stats.totalBarang} Barang Tersedia',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Dari berbagai ormawa di UPN "Veteran" Jatim',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Buka menu Katalog Barang di sidebar untuk mulai mencari '
              'barang yang Anda butuhkan dan mengajukan penyewaan.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _MiniStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.textSecondary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

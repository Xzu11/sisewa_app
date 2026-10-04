import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class LaporanData {
  final int totalPenyewaan;
  final int totalDikembalikan;
  final int totalDipinjam;
  final double totalPendapatan;
  final double totalDenda;
  final List<Map<String, dynamic>> topBarang;
  final List<Map<String, dynamic>> topOrmawa;

  const LaporanData({
    required this.totalPenyewaan,
    required this.totalDikembalikan,
    required this.totalDipinjam,
    required this.totalPendapatan,
    required this.totalDenda,
    required this.topBarang,
    required this.topOrmawa,
  });
}

final laporanProvider =
    FutureProvider.family<LaporanData, (DateTime, DateTime)>((
      ref,
      range,
    ) async {
      final db = ref.watch(databaseProvider);
      final (dari, sampai) = range;
      final sampaiAkhir = DateTime(
        sampai.year,
        sampai.month,
        sampai.day,
        23,
        59,
        59,
      );

      // ============ LOAD SEMUA & FILTER DI DART ============
      final allPenyewaan = await db.select(db.penyewaan).get();
      final allPembayaran = await db.select(db.pembayaran).get();
      final allPengembalian = await db.select(db.pengembalian).get();

      final penyewaanList = allPenyewaan
          .where(
            (p) =>
                !p.tanggalSewa.isBefore(dari) &&
                !p.tanggalSewa.isAfter(sampaiAkhir),
          )
          .toList();

      final pembayaranList = allPembayaran
          .where(
            (p) =>
                !p.tanggalBayar.isBefore(dari) &&
                !p.tanggalBayar.isAfter(sampaiAkhir) &&
                p.statusPembayaran == 'lunas',
          )
          .toList();

      final pengembalianList = allPengembalian
          .where(
            (p) =>
                !p.tanggalDikembalikan.isBefore(dari) &&
                !p.tanggalDikembalikan.isAfter(sampaiAkhir),
          )
          .toList();

      final totalPendapatan = pembayaranList.fold<double>(
        0,
        (sum, p) => sum + p.jumlahBayar,
      );
      final totalDenda = pengembalianList.fold<double>(
        0,
        (sum, p) => sum + p.denda,
      );

      // ============ TOP BARANG ============
      final detailList = await db.select(db.detailPenyewaan).get();
      final barangCount = <int, int>{};
      for (final d in detailList) {
        barangCount[d.idBarang] = (barangCount[d.idBarang] ?? 0) + d.jumlah;
      }
      final sortedBarang = barangCount.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final topBarang = <Map<String, dynamic>>[];
      for (final e in sortedBarang.take(5)) {
        final b = await (db.select(
          db.barang,
        )..where((t) => t.idBarang.equals(e.key))).getSingleOrNull();
        if (b != null) topBarang.add({'nama': b.namaBarang, 'total': e.value});
      }

      // ============ TOP ORMAWA ============
      final ormawaCount = <int, int>{};
      for (final p in penyewaanList) {
        ormawaCount[p.idOrganisasi] = (ormawaCount[p.idOrganisasi] ?? 0) + 1;
      }
      final sortedOrmawa = ormawaCount.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      final topOrmawa = <Map<String, dynamic>>[];
      for (final e in sortedOrmawa.take(5)) {
        final o = await (db.select(
          db.organisasi,
        )..where((t) => t.idOrganisasi.equals(e.key))).getSingleOrNull();
        if (o != null)
          topOrmawa.add({'nama': o.namaOrganisasi, 'total': e.value});
      }

      return LaporanData(
        totalPenyewaan: penyewaanList.length,
        totalDikembalikan: penyewaanList
            .where((p) => p.statusPenyewaan == 'dikembalikan')
            .length,
        totalDipinjam: penyewaanList
            .where((p) => p.statusPenyewaan == 'dipinjam')
            .length,
        totalPendapatan: totalPendapatan,
        totalDenda: totalDenda,
        topBarang: topBarang,
        topOrmawa: topOrmawa,
      );
    });

class LaporanScreen extends ConsumerStatefulWidget {
  const LaporanScreen({super.key});

  @override
  ConsumerState<LaporanScreen> createState() => _LaporanScreenState();
}

class _LaporanScreenState extends ConsumerState<LaporanScreen> {
  DateTime _dari = DateTime.now().subtract(const Duration(days: 30));
  DateTime _sampai = DateTime.now();

  Future<void> _pickDate(bool isDari) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: isDari ? _dari : _sampai,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked == null) return;
    setState(() {
      if (isDari) {
        _dari = picked;
      } else {
        _sampai = picked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(laporanProvider((_dari, _sampai)));
    final cf = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final df = DateFormat('dd MMM yyyy', 'id_ID');
    final authState = ref.watch(authProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Laporan', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 4),
          Text(
            'Ringkasan performa penyewaan',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),

          // Filter tanggal
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _dateButton(
                      'Dari',
                      _dari,
                      () => _pickDate(true),
                      df,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _dateButton(
                      'Sampai',
                      _sampai,
                      () => _pickDate(false),
                      df,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => setState(() {
                      _dari = DateTime.now().subtract(const Duration(days: 30));
                      _sampai = DateTime.now();
                    }),
                    icon: const Icon(Icons.refresh_rounded, size: 16),
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          asyncData.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Summary cards
                LayoutBuilder(
                  builder: (context, c) {
                    final cols = c.maxWidth > 900 ? 4 : 2;
                    return GridView.count(
                      crossAxisCount: cols,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.2,
                      children: [
                        _sumCard(
                          'Total Penyewaan',
                          '${data.totalPenyewaan}',
                          Icons.assignment_outlined,
                          AppColors.primary,
                        ),
                        _sumCard(
                          'Dikembalikan',
                          '${data.totalDikembalikan}',
                          Icons.assignment_turned_in_outlined,
                          AppColors.success,
                        ),
                        _sumCard(
                          'Masih Dipinjam',
                          '${data.totalDipinjam}',
                          Icons.assignment_late_outlined,
                          AppColors.warning,
                        ),
                        _sumCard(
                          'Total Pendapatan',
                          cf.format(data.totalPendapatan),
                          Icons.payments_outlined,
                          AppColors.primary,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Top barang & ormawa
                LayoutBuilder(
                  builder: (context, c) {
                    final wide = c.maxWidth > 800;
                    if (wide) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _topCard(
                              'Top 5 Barang Paling Disewa',
                              data.topBarang,
                              Icons.inventory_2_outlined,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _topCard(
                              'Top 5 Ormawa Paling Aktif',
                              data.topOrmawa,
                              Icons.storefront_outlined,
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        _topCard(
                          'Top 5 Barang Paling Disewa',
                          data.topBarang,
                          Icons.inventory_2_outlined,
                        ),
                        const SizedBox(height: 16),
                        _topCard(
                          'Top 5 Ormawa Paling Aktif',
                          data.topOrmawa,
                          Icons.storefront_outlined,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateButton(
    String label,
    DateTime date,
    VoidCallback onTap,
    DateFormat df,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 16,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textHint,
                  ),
                ),
                Text(
                  df.format(date),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sumCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 12),
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
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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

  Widget _topCard(
    String title,
    List<Map<String, dynamic>> items,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            if (items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Belum ada data',
                  style: TextStyle(color: AppColors.textHint),
                ),
              )
            else
              ...items.asMap().entries.map((e) {
                final i = e.key;
                final item = e.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.primarySurface,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item['nama'],
                          style: const TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${item['total']}x',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }
}

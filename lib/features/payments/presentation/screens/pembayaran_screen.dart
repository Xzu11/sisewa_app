import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/pembayaran_entity.dart';
import '../providers/pembayaran_provider.dart';
import '../widgets/pembayaran_form_dialog.dart';

class PembayaranScreen extends ConsumerWidget {
  const PembayaranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(pembayaranListProvider);
    final authState = ref.watch(authProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final canCreate = user?.role == 'admin' || user?.role == 'penyewa';
    final canVerify = user?.role == 'admin' || user?.role == 'ormawa';

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kelola pembayaran penyewaan',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              if (canCreate)
                ElevatedButton.icon(
                  onPressed: () async {
                    final r = await PembayaranFormDialog.show(context);
                    if (r == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pembayaran berhasil dicatat'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Tambah Pembayaran'),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: listAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (items) {
                if (items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.payments_outlined,
                          size: 64,
                          color: AppColors.textHint,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Belum ada pembayaran',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, i) => _PembayaranCard(
                    data: items[i],
                    canVerify: canVerify,
                    onVerify: (status) async {
                      final err = await ref
                          .read(pembayaranActionProvider.notifier)
                          .verify(items[i].idPembayaran, status);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(err ?? 'Status diubah'),
                            backgroundColor: err == null
                                ? AppColors.success
                                : AppColors.error,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PembayaranCard extends StatelessWidget {
  final PembayaranEntity data;
  final bool canVerify;
  final ValueChanged<String> onVerify;

  const _PembayaranCard({
    required this.data,
    required this.canVerify,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    final cf = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    final df = DateFormat('dd MMM yyyy', 'id_ID');

    Color bg, fg;
    switch (data.statusPembayaran) {
      case 'lunas':
        bg = AppColors.successBg;
        fg = AppColors.success;
        break;
      case 'gagal':
        bg = AppColors.errorBg;
        fg = AppColors.error;
        break;
      default:
        bg = AppColors.warningBg;
        fg = AppColors.warning;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.kodeSewa,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${data.jenisPembayaran.toUpperCase()} • ${data.metodePembayaran}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    data.statusLabel,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: fg,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.payments_outlined,
                  size: 14,
                  color: AppColors.textHint,
                ),
                const SizedBox(width: 6),
                Text(
                  cf.format(data.jumlahBayar),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),
                Text(
                  df.format(data.tanggalBayar),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (data.keterangan != null) ...[
              const SizedBox(height: 6),
              Text(
                data.keterangan!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
            if (canVerify && data.statusPembayaran == 'pending') ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => onVerify('lunas'),
                    icon: const Icon(Icons.check_rounded, size: 14),
                    label: const Text('Verifikasi Lunas'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.success,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      minimumSize: Size.zero,
                      textStyle: const TextStyle(fontSize: 11),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => onVerify('gagal'),
                    icon: const Icon(Icons.close_rounded, size: 14),
                    label: const Text('Tolak'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      minimumSize: Size.zero,
                      textStyle: const TextStyle(fontSize: 11),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

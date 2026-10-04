import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entities/penyewaan_entity.dart';
import '../providers/penyewaan_provider.dart';
import '../widgets/penyewaan_form_dialog.dart';

class PenyewaanScreen extends ConsumerStatefulWidget {
  const PenyewaanScreen({super.key});

  @override
  ConsumerState<PenyewaanScreen> createState() => _PenyewaanScreenState();
}

class _PenyewaanScreenState extends ConsumerState<PenyewaanScreen> {
  Future<void> _openForm() async {
    final result = await PenyewaanFormDialog.show(context);
    if (result == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Penyewaan berhasil diajukan!'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _confirmDelete(PenyewaanEntity s) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Batalkan Penyewaan'),
        content: Text('Yakin ingin membatalkan "${s.kodeSewa}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ya, Batalkan'),
          ),
        ],
      ),
    );
    if (confirm == true) {
      final err = await ref.read(penyewaanProvider.notifier).delete(s.idSewa);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(err ?? 'Penyewaan dibatalkan'),
          backgroundColor: err == null ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  Future<void> _updateStatus(PenyewaanEntity s, String newStatus) async {
    final err = await ref
        .read(penyewaanProvider.notifier)
        .updateStatus(s.idSewa, newStatus);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(err ?? 'Status berhasil diubah'),
        backgroundColor: err == null ? AppColors.success : AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(penyewaanProvider);
    final authState = ref.watch(authProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;
    final canCreate = user?.role == 'admin' || user?.role == 'penyewa';
    final isAdminOrOrmawa = user?.role == 'admin' || user?.role == 'ormawa';

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
                      'Penyewaan',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      isAdminOrOrmawa
                          ? 'Kelola pengajuan & transaksi penyewaan'
                          : 'Lihat pengajuan penyewaan Anda',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              if (canCreate)
                ElevatedButton.icon(
                  onPressed: _openForm,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Ajukan Sewa'),
                ),
            ],
          ),
          const SizedBox(height: 16),

          // Filter status
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _filterChip('Semua', null, state),
                _filterChip('Menunggu', 'menunggu', state),
                _filterChip('Disetujui', 'disetujui', state),
                _filterChip('Dipinjam', 'dipinjam', state),
                _filterChip('Dikembalikan', 'dikembalikan', state),
                _filterChip('Ditolak', 'ditolak', state),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(child: _buildContent(state, isAdminOrOrmawa)),
        ],
      ),
    );
  }

  Widget _filterChip(String label, String? value, PenyewaanState state) {
    final selected = state.filterStatus == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => ref
            .read(penyewaanProvider.notifier)
            .load(status: value, clearFilter: value == null),
        selectedColor: AppColors.primarySurface,
        checkmarkColor: AppColors.primary,
      ),
    );
  }

  Widget _buildContent(PenyewaanState state, bool isAdminOrOrmawa) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.assignment_outlined,
              size: 64,
              color: AppColors.textHint,
            ),
            const SizedBox(height: 16),
            Text(
              'Belum ada penyewaan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 6),
            Text(
              'Klik "Ajukan Sewa" untuk memulai',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, i) => _PenyewaanCard(
        data: state.items[i],
        isAdminOrOrmawa: isAdminOrOrmawa,
        onDelete: () => _confirmDelete(state.items[i]),
        onUpdateStatus: (s) => _updateStatus(state.items[i], s),
      ),
    );
  }
}

class _PenyewaanCard extends StatelessWidget {
  final PenyewaanEntity data;
  final bool isAdminOrOrmawa;
  final VoidCallback onDelete;
  final ValueChanged<String> onUpdateStatus;

  const _PenyewaanCard({
    required this.data,
    required this.isAdminOrOrmawa,
    required this.onDelete,
    required this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd MMM yyyy', 'id_ID');
    final cf = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

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
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        data.namaOrganisasi ?? '-',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                _statusBadge(data.statusPenyewaan),
              ],
            ),
            const Divider(height: 20),
            Row(
              children: [
                Expanded(
                  child: _infoColumn(
                    'Tanggal Sewa',
                    df.format(data.tanggalSewa),
                    Icons.calendar_today_outlined,
                  ),
                ),
                Expanded(
                  child: _infoColumn(
                    'Rencana Kembali',
                    df.format(data.tanggalRencanaKembali),
                    Icons.event_available_outlined,
                  ),
                ),
                Expanded(
                  child: _infoColumn(
                    'Total',
                    cf.format(data.totalHarga),
                    Icons.payments_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'DP: ${cf.format(data.dp)} • Sisa: ${cf.format(data.sisaBayar)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            if (isAdminOrOrmawa) ...[
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  if (data.statusPenyewaan == 'menunggu') ...[
                    _actionButton(
                      'Setujui',
                      AppColors.success,
                      () => onUpdateStatus('disetujui'),
                    ),
                    _actionButton(
                      'Tolak',
                      AppColors.error,
                      () => onUpdateStatus('ditolak'),
                    ),
                  ],
                  if (data.statusPenyewaan == 'disetujui')
                    _actionButton(
                      'Tandai Dipinjam',
                      AppColors.info,
                      () => onUpdateStatus('dipinjam'),
                    ),
                  if (data.statusPenyewaan == 'dipinjam')
                    _actionButton(
                      'Tandai Dikembalikan',
                      AppColors.success,
                      () => onUpdateStatus('dikembalikan'),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onDelete,
                icon: const Icon(Icons.cancel_outlined, size: 16),
                label: const Text('Batalkan'),
                style: TextButton.styleFrom(foregroundColor: AppColors.error),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoColumn(String label, String value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 12, color: AppColors.textHint),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: AppColors.textHint),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _statusBadge(String status) {
    Color bg, fg;
    switch (status) {
      case 'menunggu':
        bg = AppColors.warningBg;
        fg = AppColors.warning;
        break;
      case 'disetujui':
        bg = AppColors.infoBg;
        fg = AppColors.info;
        break;
      case 'dipinjam':
        bg = AppColors.primarySurface;
        fg = AppColors.primary;
        break;
      case 'dikembalikan':
        bg = AppColors.successBg;
        fg = AppColors.success;
        break;
      case 'ditolak':
        bg = AppColors.errorBg;
        fg = AppColors.error;
        break;
      default:
        bg = AppColors.divider;
        fg = AppColors.textSecondary;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status[0].toUpperCase() + status.substring(1),
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  Widget _actionButton(String label, Color color, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        minimumSize: Size.zero,
        textStyle: const TextStyle(fontSize: 11),
      ),
      child: Text(label),
    );
  }
}

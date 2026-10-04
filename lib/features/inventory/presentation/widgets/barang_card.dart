import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/barang_entity.dart';

class BarangCard extends StatelessWidget {
  final BarangEntity barang;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const BarangCard({
    super.key,
    required this.barang,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== FOTO =====
            _buildPhoto(),
            const SizedBox(width: 14),

            // ===== INFO =====
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama + kondisi badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          barang.namaBarang,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _kondisiBadge(),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Kategori
                  Row(
                    children: [
                      const Icon(
                        Icons.category_outlined,
                        size: 12,
                        color: AppColors.textHint,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        barang.namaKategori ?? '-',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Deskripsi
                  if (barang.deskripsi != null && barang.deskripsi!.isNotEmpty)
                    Text(
                      barang.deskripsi!,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),

                  // Stok info
                  Row(
                    children: [
                      _stokChip(
                        icon: Icons.inventory_2_outlined,
                        label: 'Total: ${barang.stokTotal}',
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      _stokChip(
                        icon: Icons.check_circle_outline,
                        label: 'Tersedia: ${barang.stokTersedia}',
                        color: barang.stokHabis
                            ? AppColors.error
                            : AppColors.success,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== ACTIONS =====
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  color: AppColors.primary,
                  tooltip: 'Edit',
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: AppColors.error,
                  tooltip: 'Hapus',
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child:
          barang.fotoBarang != null &&
              barang.fotoBarang!.isNotEmpty &&
              File(barang.fotoBarang!).existsSync()
          ? Image.file(File(barang.fotoBarang!), fit: BoxFit.cover)
          : const Icon(
              Icons.inventory_2_outlined,
              color: AppColors.primary,
              size: 30,
            ),
    );
  }

  Widget _kondisiBadge() {
    Color bg;
    Color fg;
    switch (barang.kondisi) {
      case 'baik':
        bg = AppColors.successBg;
        fg = AppColors.success;
        break;
      case 'rusak_ringan':
        bg = AppColors.warningBg;
        fg = AppColors.warning;
        break;
      case 'rusak_berat':
        bg = AppColors.errorBg;
        fg = AppColors.error;
        break;
      default:
        bg = AppColors.divider;
        fg = AppColors.textSecondary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        barang.kondisiLabel,
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: fg),
      ),
    );
  }

  Widget _stokChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

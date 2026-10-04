import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/barang_entity.dart';
import '../providers/barang_provider.dart';
import '../providers/kategori_provider.dart';
import '../widgets/barang_card.dart';
import '../widgets/barang_form_dialog.dart';

class BarangScreen extends ConsumerStatefulWidget {
  const BarangScreen({super.key});

  @override
  ConsumerState<BarangScreen> createState() => _BarangScreenState();
}

class _BarangScreenState extends ConsumerState<BarangScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _openForm({BarangEntity? initial}) async {
    final result = await BarangFormDialog.show(context, initial: initial);
    if (result == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            initial == null
                ? 'Barang berhasil ditambahkan'
                : 'Barang berhasil diperbarui',
          ),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _confirmDelete(BarangEntity barang) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Hapus Barang'),
        content: Text(
          'Yakin ingin menghapus "${barang.namaBarang}"?\n\n'
          'Data tidak akan benar-benar hilang, hanya dinonaktifkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success = await ref
          .read(barangProvider.notifier)
          .delete(barang.idBarang);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? 'Barang berhasil dihapus' : 'Gagal menghapus barang',
          ),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(barangProvider);
    final kategoriState = ref.watch(kategoriProvider);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Barang',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kelola inventaris barang ormawa',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _openForm(),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Tambah Barang'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ===== FILTER ROW =====
          Row(
            children: [
              // Search
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _searchCtrl,
                  decoration: InputDecoration(
                    hintText: 'Cari barang...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    suffixIcon: state.searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              _searchCtrl.clear();
                              ref
                                  .read(barangProvider.notifier)
                                  .load(search: '');
                            },
                          )
                        : null,
                  ),
                  onChanged: (value) {
                    ref.read(barangProvider.notifier).load(search: value);
                  },
                ),
              ),
              const SizedBox(width: 12),

              // Filter Kategori
              Expanded(
                flex: 1,
                child: DropdownButtonFormField<int?>(
                  initialValue: state.filterKategoriId,
                  decoration: const InputDecoration(
                    hintText: 'Semua Kategori',
                    prefixIcon: Icon(Icons.filter_list_rounded),
                  ),
                  items: [
                    const DropdownMenuItem<int?>(
                      value: null,
                      child: Text('Semua Kategori'),
                    ),
                    ...kategoriState.items.map((k) {
                      return DropdownMenuItem<int?>(
                        value: k.idKategori,
                        child: Text(k.namaKategori),
                      );
                    }),
                  ],
                  onChanged: (v) {
                    ref
                        .read(barangProvider.notifier)
                        .load(idKategori: v, clearFilter: v == null);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ===== CONTENT =====
          Expanded(child: _buildContent(state)),
        ],
      ),
    );
  }

  Widget _buildContent(BarangState state) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.items.isEmpty) {
      return _emptyState();
    }

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, i) {
        final barang = state.items[i];
        return BarangCard(
          barang: barang,
          onEdit: () => _openForm(initial: barang),
          onDelete: () => _confirmDelete(barang),
        );
      },
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              color: AppColors.primarySurface,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.inventory_2_outlined,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Belum ada barang',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            'Mulai dengan menambahkan barang pertama',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _openForm(),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Tambah Barang'),
          ),
        ],
      ),
    );
  }
}

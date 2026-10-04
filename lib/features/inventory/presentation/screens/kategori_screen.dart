import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/kategori_entity.dart';
import '../providers/kategori_provider.dart';
import '../widgets/kategori_card.dart';
import '../widgets/kategori_form_dialog.dart';

class KategoriScreen extends ConsumerStatefulWidget {
  const KategoriScreen({super.key});

  @override
  ConsumerState<KategoriScreen> createState() => _KategoriScreenState();
}

class _KategoriScreenState extends ConsumerState<KategoriScreen> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _openForm({KategoriEntity? initial}) async {
    final result = await KategoriFormDialog.show(context, initial: initial);
    if (result == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            initial == null
                ? 'Kategori berhasil ditambahkan'
                : 'Kategori berhasil diperbarui',
          ),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  Future<void> _confirmDelete(KategoriEntity kategori) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Hapus Kategori'),
        content: Text(
          'Yakin ingin menghapus kategori "${kategori.namaKategori}"?\n\n'
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
          .read(kategoriProvider.notifier)
          .delete(kategori.idKategori);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success ? 'Kategori berhasil dihapus' : 'Gagal menghapus kategori',
          ),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(kategoriProvider);

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
                      'Kategori Barang',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kelola kategori untuk pengelompokan barang',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => _openForm(),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Tambah Kategori'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ===== SEARCH =====
          TextField(
            controller: _searchCtrl,
            decoration: InputDecoration(
              hintText: 'Cari kategori...',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: state.searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () {
                        _searchCtrl.clear();
                        ref.read(kategoriProvider.notifier).load(search: '');
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              ref.read(kategoriProvider.notifier).load(search: value);
            },
          ),
          const SizedBox(height: 20),

          // ===== CONTENT =====
          Expanded(child: _buildContent(state)),
        ],
      ),
    );
  }

  Widget _buildContent(KategoriState state) {
    if (state.isLoading && state.items.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.items.isEmpty) {
      return _emptyState();
    }

    return ListView.builder(
      itemCount: state.items.length,
      itemBuilder: (context, i) {
        final kategori = state.items[i];
        return KategoriCard(
          kategori: kategori,
          onEdit: () => _openForm(initial: kategori),
          onDelete: () => _confirmDelete(kategori),
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
            decoration: BoxDecoration(
              color: AppColors.primarySurface,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.category_outlined,
              size: 48,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Belum ada kategori',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            'Mulai dengan menambahkan kategori barang pertama',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _openForm(),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Tambah Kategori'),
          ),
        ],
      ),
    );
  }
}

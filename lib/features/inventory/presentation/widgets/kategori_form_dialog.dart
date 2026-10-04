import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/kategori_entity.dart';
import '../providers/kategori_provider.dart';

class KategoriFormDialog extends ConsumerStatefulWidget {
  final KategoriEntity? initial; // null = tambah, non-null = edit

  const KategoriFormDialog({super.key, this.initial});

  static Future<bool?> show(BuildContext context, {KategoriEntity? initial}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => KategoriFormDialog(initial: initial),
    );
  }

  @override
  ConsumerState<KategoriFormDialog> createState() => _KategoriFormDialogState();
}

class _KategoriFormDialogState extends ConsumerState<KategoriFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaCtrl;
  late final TextEditingController _deskripsiCtrl;
  bool _isSubmitting = false;

  bool get _isEdit => widget.initial != null;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.initial?.namaKategori ?? '');
    _deskripsiCtrl = TextEditingController(
      text: widget.initial?.deskripsi ?? '',
    );
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _deskripsiCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    final notifier = ref.read(kategoriProvider.notifier);
    bool success;

    if (_isEdit) {
      success = await notifier.update(
        idKategori: widget.initial!.idKategori,
        namaKategori: _namaCtrl.text.trim(),
        deskripsi: _deskripsiCtrl.text.trim().isEmpty
            ? null
            : _deskripsiCtrl.text.trim(),
      );
    } else {
      success = await notifier.create(
        namaKategori: _namaCtrl.text.trim(),
        deskripsi: _deskripsiCtrl.text.trim().isEmpty
            ? null
            : _deskripsiCtrl.text.trim(),
      );
    }

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (success) {
      Navigator.of(context).pop(true);
    } else {
      final err = ref.read(kategoriProvider).error ?? 'Terjadi kesalahan';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        _isEdit ? Icons.edit_outlined : Icons.add_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _isEdit ? 'Edit Kategori' : 'Tambah Kategori',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            _isEdit
                                ? 'Ubah data kategori barang'
                                : 'Buat kategori barang baru',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: _isSubmitting
                          ? null
                          : () => Navigator.of(context).pop(false),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Field: Nama
                TextFormField(
                  controller: _namaCtrl,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Nama Kategori *',
                    hintText: 'cth: Elektronik, Tenda, Sound System',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Nama kategori wajib diisi';
                    }
                    if (v.trim().length < 3) {
                      return 'Nama minimal 3 karakter';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Field: Deskripsi
                TextFormField(
                  controller: _deskripsiCtrl,
                  maxLines: 3,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi (opsional)',
                    hintText: 'Keterangan tambahan tentang kategori ini',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 24),

                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: _isSubmitting
                          ? null
                          : () => Navigator.of(context).pop(false),
                      child: const Text('Batal'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: _isSubmitting ? null : _submit,
                      icon: _isSubmitting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Icon(
                              _isEdit ? Icons.save_outlined : Icons.add_rounded,
                            ),
                      label: Text(_isEdit ? 'Simpan' : 'Tambah'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

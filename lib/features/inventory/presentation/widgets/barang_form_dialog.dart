import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../../core/database/database_provider.dart';
import '../../domain/entities/barang_entity.dart';
import '../providers/barang_provider.dart';
import '../providers/kategori_provider.dart';

class BarangFormDialog extends ConsumerStatefulWidget {
  final BarangEntity? initial;

  const BarangFormDialog({super.key, this.initial});

  static Future<bool?> show(BuildContext context, {BarangEntity? initial}) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => BarangFormDialog(initial: initial),
    );
  }

  @override
  ConsumerState<BarangFormDialog> createState() => _BarangFormDialogState();
}

class _BarangFormDialogState extends ConsumerState<BarangFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaCtrl;
  late final TextEditingController _deskripsiCtrl;
  late final TextEditingController _stokTotalCtrl;
  late final TextEditingController _stokTersediaCtrl;

  int? _selectedKategoriId;
  String _kondisi = AppConstants.kondisiBaik;
  String? _fotoPath;
  bool _isSubmitting = false;

  bool get _isEdit => widget.initial != null;

  @override
  void initState() {
    super.initState();
    _namaCtrl = TextEditingController(text: widget.initial?.namaBarang ?? '');
    _deskripsiCtrl = TextEditingController(
      text: widget.initial?.deskripsi ?? '',
    );
    _stokTotalCtrl = TextEditingController(
      text: widget.initial?.stokTotal.toString() ?? '1',
    );
    _stokTersediaCtrl = TextEditingController(
      text: widget.initial?.stokTersedia.toString() ?? '1',
    );
    _selectedKategoriId = widget.initial?.idKategori;
    _kondisi = widget.initial?.kondisi ?? AppConstants.kondisiBaik;
    _fotoPath = widget.initial?.fotoBarang;
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _deskripsiCtrl.dispose();
    _stokTotalCtrl.dispose();
    _stokTersediaCtrl.dispose();
    super.dispose();
  }

  // ============ PILIH FOTO ============
    // ============ PILIH FOTO ============
  Future<void> _pickImage() async {
    try {
      const XTypeGroup typeGroup = XTypeGroup(
        label: 'Images',
        extensions: <String>['jpg', 'jpeg', 'png', 'webp', 'bmp'],
      );
      final XFile? file = await openFile(
        acceptedTypeGroups: <XTypeGroup>[typeGroup],
      );
      if (file == null) return;

      final saved = await _saveImagePermanently(file.path);
      if (saved != null && mounted) {
        setState(() => _fotoPath = saved);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal memilih foto: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Future<String?> _saveImagePermanently(String sourcePath) async {
    try {
      final ext = p.extension(sourcePath);
      final filename = 'barang_${DateTime.now().millisecondsSinceEpoch}$ext';

      // Folder: <root proyek>/data/images/barang/
      final projectRoot = Directory.current.path.contains('build')
          ? p.normalize(
              p.join(Directory.current.path, '..', '..', '..', '..', '..'),
            )
          : Directory.current.path;
      final destDir = Directory(
        p.join(projectRoot, 'data', 'images', 'barang'),
      );
      if (!await destDir.exists()) {
        await destDir.create(recursive: true);
      }
      final destPath = p.join(destDir.path, filename);
      await File(sourcePath).copy(destPath);
      return destPath;
    } catch (e) {
      debugPrint('Error saving image: $e');
      return null;
    }
  }

  // ============ SUBMIT ============
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedKategoriId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih kategori terlebih dahulu'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    final authState = ref.read(authProvider);
    final user = authState is AuthAuthenticated ? authState.user : null;

    // Ambil organisasi pertama sebagai default
    // Ambil organisasi pertama sebagai default
    final db = ref.read(databaseProvider);
    final orgs = await db.select(db.organisasi).get();
    if (orgs.isEmpty) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Belum ada organisasi. Jalankan app sekali lagi untuk seed.',
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }
    final idOrganisasi = orgs.first.idOrganisasi;

    final notifier = ref.read(barangProvider.notifier);
    final stokTotal = int.tryParse(_stokTotalCtrl.text) ?? 0;
    final stokTersedia = int.tryParse(_stokTersediaCtrl.text) ?? 0;
    final deskripsi = _deskripsiCtrl.text.trim().isEmpty
        ? null
        : _deskripsiCtrl.text.trim();

    bool success;
    if (_isEdit) {
      success = await notifier.update(
        idBarang: widget.initial!.idBarang,
        idKategori: _selectedKategoriId!,
        namaBarang: _namaCtrl.text.trim(),
        deskripsi: deskripsi,
        fotoBarang: _fotoPath,
        stokTotal: stokTotal,
        stokTersedia: stokTersedia,
        kondisi: _kondisi,
      );
    } else {
      success = await notifier.create(
        idKategori: _selectedKategoriId!,
        idOrganisasi: idOrganisasi,
        namaBarang: _namaCtrl.text.trim(),
        deskripsi: deskripsi,
        fotoBarang: _fotoPath,
        stokTotal: stokTotal,
        stokTersedia: stokTersedia,
        kondisi: _kondisi,
      );
    }

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (success) {
      Navigator.of(context).pop(true);
    } else {
      final err = ref.read(barangProvider).error ?? 'Terjadi kesalahan';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final kategoriAsync = ref.watch(kategoriProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560, maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ===== HEADER =====
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Row(
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
                          _isEdit ? 'Edit Barang' : 'Tambah Barang',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          _isEdit
                              ? 'Ubah data barang'
                              : 'Tambah barang baru ke inventory',
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
            ),
            const Divider(height: 1),

            // ===== FORM (scrollable) =====
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // FOTO
                      _buildPhotoPicker(),
                      const SizedBox(height: 20),

                      // NAMA
                      TextFormField(
                        controller: _namaCtrl,
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Nama Barang *',
                          hintText: 'cth: Tenda Kapasitas 4 Orang',
                          prefixIcon: Icon(Icons.inventory_2_outlined),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Nama barang wajib diisi';
                          }
                          if (v.trim().length < 3) {
                            return 'Nama minimal 3 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // KATEGORI
                      DropdownButtonFormField<int>(
                        initialValue: _selectedKategoriId,
                        decoration: const InputDecoration(
                          labelText: 'Kategori *',
                          prefixIcon: Icon(Icons.category_outlined),
                        ),
                        items: kategoriAsync.items.map((k) {
                          return DropdownMenuItem<int>(
                            value: k.idKategori,
                            child: Text(k.namaKategori),
                          );
                        }).toList(),
                        onChanged: (v) =>
                            setState(() => _selectedKategoriId = v),
                        validator: (v) =>
                            v == null ? 'Kategori wajib dipilih' : null,
                      ),
                      const SizedBox(height: 16),

                      // KONDISI
                      DropdownButtonFormField<String>(
                        initialValue: _kondisi,
                        decoration: const InputDecoration(
                          labelText: 'Kondisi *',
                          prefixIcon: Icon(Icons.health_and_safety_outlined),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: AppConstants.kondisiBaik,
                            child: Text('Baik'),
                          ),
                          DropdownMenuItem(
                            value: AppConstants.kondisiRusakRingan,
                            child: Text('Rusak Ringan'),
                          ),
                          DropdownMenuItem(
                            value: AppConstants.kondisiRusakBerat,
                            child: Text('Rusak Berat'),
                          ),
                        ],
                        onChanged: (v) => setState(() => _kondisi = v!),
                      ),
                      const SizedBox(height: 16),

                      // STOK (2 kolom)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _stokTotalCtrl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Stok Total *',
                                prefixIcon: Icon(Icons.inventory_outlined),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Wajib diisi';
                                }
                                final n = int.tryParse(v);
                                if (n == null || n < 0) return 'Tidak valid';
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _stokTersediaCtrl,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Stok Tersedia *',
                                prefixIcon: Icon(Icons.check_circle_outline),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return 'Wajib diisi';
                                }
                                final n = int.tryParse(v);
                                if (n == null || n < 0) return 'Tidak valid';
                                final total =
                                    int.tryParse(_stokTotalCtrl.text) ?? 0;
                                if (n > total) {
                                  return 'Melebihi total';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // DESKRIPSI
                      TextFormField(
                        controller: _deskripsiCtrl,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi (opsional)',
                          hintText: 'Keterangan tambahan tentang barang',
                          alignLabelWithHint: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ===== ACTIONS =====
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
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
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Icon(
                            _isEdit ? Icons.save_outlined : Icons.add_rounded,
                          ),
                    label: Text(_isEdit ? 'Simpan' : 'Tambah'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: _isSubmitting ? null : _pickImage,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              clipBehavior: Clip.antiAlias,
              child: _fotoPath != null && File(_fotoPath!).existsSync()
                  ? Image.file(File(_fotoPath!), fit: BoxFit.cover)
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 32,
                          color: AppColors.primary,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Pilih Foto',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          if (_fotoPath != null)
            TextButton.icon(
              onPressed: _isSubmitting
                  ? null
                  : () => setState(() => _fotoPath = null),
              icon: const Icon(Icons.delete_outline, size: 16),
              label: const Text('Hapus Foto'),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
            ),
        ],
      ),
    );
  }
}

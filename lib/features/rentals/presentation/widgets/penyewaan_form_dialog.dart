import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../inventory/domain/entities/barang_entity.dart';
import '../../../inventory/presentation/providers/barang_provider.dart';
import '../../domain/repositories/penyewaan_repository.dart';
import '../providers/penyewaan_provider.dart';

class PenyewaanFormDialog extends ConsumerStatefulWidget {
  const PenyewaanFormDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PenyewaanFormDialog(),
    );
  }

  @override
  ConsumerState<PenyewaanFormDialog> createState() =>
      _PenyewaanFormDialogState();
}

class _PenyewaanFormDialogState extends ConsumerState<PenyewaanFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _catatanCtrl = TextEditingController();
  final _dpCtrl = TextEditingController(text: '0');

  int? _idOrganisasi;
  DateTime _tanggalSewa = DateTime.now();
  DateTime _tanggalKembali = DateTime.now().add(const Duration(days: 1));
  final Map<int, int> _selectedItems = {}; // idBarang -> jumlah
  bool _isSubmitting = false;

  // Cache harga barang
  final Map<int, double> _hargaCache = {};

  @override
  void dispose() {
    _catatanCtrl.dispose();
    _dpCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate(bool isSewa) async {
    final initial = isSewa ? _tanggalSewa : _tanggalKembali;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked == null) return;

    setState(() {
      if (isSewa) {
        _tanggalSewa = picked;
        if (_tanggalKembali.isBefore(_tanggalSewa)) {
          _tanggalKembali = _tanggalSewa.add(const Duration(days: 1));
        }
      } else {
        _tanggalKembali = picked;
      }
    });
  }

  int get _jumlahHari => _tanggalKembali.difference(_tanggalSewa).inDays + 1;

  double get _totalHarga {
    double total = 0;
    _selectedItems.forEach((idBarang, jumlah) {
      final harga = _hargaCache[idBarang] ?? 10000; // default 10rb/hari
      total += harga * jumlah;
    });
    return total * _jumlahHari;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_idOrganisasi == null) {
      _showError('Pilih ormawa penyedia terlebih dahulu');
      return;
    }
    if (_selectedItems.isEmpty) {
      _showError('Pilih minimal 1 barang');
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final authState = ref.read(authProvider);
      final user = authState is AuthAuthenticated ? authState.user : null;
      if (user == null) throw Exception('User tidak ditemukan');

      // Cari peminjam
      final db = ref.read(databaseProvider);
      final peminjam =
          await (db.select(db.peminjam)
                ..where((t) => t.idUser.equals(user.idUser))
                ..limit(1))
              .getSingleOrNull();

      if (peminjam == null) {
        throw Exception('Data peminjam tidak ditemukan. Hubungi admin.');
      }

      final dp = double.tryParse(_dpCtrl.text.trim()) ?? 0;

      final items = _selectedItems.entries.map((e) {
        return DetailItem(
          idBarang: e.key,
          jumlah: e.value,
          hargaSatuan: _hargaCache[e.key] ?? 10000,
        );
      }).toList();

      final data = CreatePenyewaanData(
        idPeminjam: peminjam.idPeminjam,
        idOrganisasi: _idOrganisasi!,
        tanggalSewa: _tanggalSewa,
        tanggalRencanaKembali: _tanggalKembali,
        dp: dp,
        catatan: _catatanCtrl.text.trim().isEmpty
            ? null
            : _catatanCtrl.text.trim(),
        items: items,
      );

      final err = await ref.read(penyewaanProvider.notifier).create(data);

      if (!mounted) return;
      setState(() => _isSubmitting = false);

      if (err == null) {
        Navigator.of(context).pop(true);
      } else {
        _showError(err);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      _showError('Terjadi kesalahan: $e');
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: AppColors.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final barangState = ref.watch(barangProvider);

    // Group barang by organisasi
    final barangByOrg = <int, List<BarangEntity>>{};
    for (final b in barangState.items) {
      barangByOrg.putIfAbsent(b.idOrganisasi, () => []).add(b);
    }

    // Barang yang ditampilkan: hanya dari organisasi terpilih
    final availableBarang = _idOrganisasi == null
        ? <BarangEntity>[]
        : barangByOrg[_idOrganisasi] ?? [];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640, maxHeight: 780),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primarySurface,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.assignment_outlined,
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
                          'Ajukan Penyewaan',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Isi detail penyewaan barang',
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

            // BODY
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Ormawa
                      DropdownButtonFormField<int>(
                        initialValue: _idOrganisasi,
                        decoration: const InputDecoration(
                          labelText: 'Pilih Ormawa Penyedia *',
                          prefixIcon: Icon(Icons.storefront_outlined),
                        ),
                        items: barangByOrg.keys.map((orgId) {
                          final orgName =
                              barangByOrg[orgId]!.first.namaOrganisasi ?? '-';
                          return DropdownMenuItem(
                            value: orgId,
                            child: Text(orgName),
                          );
                        }).toList(),
                        onChanged: (v) => setState(() {
                          _idOrganisasi = v;
                          _selectedItems.clear();
                        }),
                        validator: (v) =>
                            v == null ? 'Ormawa wajib dipilih' : null,
                      ),
                      const SizedBox(height: 16),

                      // Tanggal
                      Row(
                        children: [
                          Expanded(
                            child: _dateField(
                              label: 'Tanggal Sewa *',
                              date: _tanggalSewa,
                              onTap: () => _pickDate(true),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _dateField(
                              label: 'Rencana Kembali *',
                              date: _tanggalKembali,
                              onTap: () => _pickDate(false),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.infoBg,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Durasi: $_jumlahHari hari',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.info,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Daftar barang
                      if (_idOrganisasi == null)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Pilih ormawa terlebih dahulu untuk melihat barang',
                            style: TextStyle(color: AppColors.textHint),
                            textAlign: TextAlign.center,
                          ),
                        )
                      else if (availableBarang.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.warningBg,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Tidak ada barang tersedia dari ormawa ini',
                            style: TextStyle(color: AppColors.warning),
                            textAlign: TextAlign.center,
                          ),
                        )
                      else ...[
                        Text(
                          'Pilih Barang *',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.primary),
                        ),
                        const SizedBox(height: 8),
                        ...availableBarang.map((b) => _barangTile(b)),
                      ],

                      const SizedBox(height: 16),

                      // DP
                      TextFormField(
                        controller: _dpCtrl,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'DP (Rp)',
                          prefixIcon: Icon(Icons.payments_outlined),
                          hintText: '0',
                        ),
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 16),

                      // Catatan
                      TextFormField(
                        controller: _catatanCtrl,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Catatan (opsional)',
                          prefixIcon: Icon(Icons.notes_outlined),
                          alignLabelWithHint: true,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Total
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.primarySurface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.receipt_long_outlined,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Total Harga',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp ',
                                      decimalDigits: 0,
                                    ).format(_totalHarga),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ACTIONS
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
                        : const Icon(Icons.send_rounded, size: 18),
                    label: const Text('Ajukan Sewa'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateField({
    required String label,
    required DateTime date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_today_outlined,
              size: 18,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textHint,
                    ),
                  ),
                  Text(
                    DateFormat('dd MMM yyyy', 'id_ID').format(date),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
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

  Widget _barangTile(BarangEntity barang) {
    final selected = _selectedItems.containsKey(barang.idBarang);
    final jumlah = _selectedItems[barang.idBarang] ?? 1;

    // Simpan harga default
    _hargaCache.putIfAbsent(barang.idBarang, () => 10000);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: selected ? AppColors.primarySurface : AppColors.surface,
      child: InkWell(
        onTap: () {
          setState(() {
            if (selected) {
              _selectedItems.remove(barang.idBarang);
            } else {
              _selectedItems[barang.idBarang] = 1;
            }
          });
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Checkbox(
                value: selected,
                onChanged: (_) {
                  setState(() {
                    if (selected) {
                      _selectedItems.remove(barang.idBarang);
                    } else {
                      _selectedItems[barang.idBarang] = 1;
                    }
                  });
                },
                activeColor: AppColors.primary,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barang.namaBarang,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Stok tersedia: ${barang.stokTersedia} • ${barang.kondisiLabel}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textHint,
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                      onPressed: jumlah > 1
                          ? () => setState(
                              () =>
                                  _selectedItems[barang.idBarang] = jumlah - 1,
                            )
                          : null,
                    ),
                    Text(
                      '$jumlah',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline, size: 20),
                      onPressed: jumlah < barang.stokTersedia
                          ? () => setState(
                              () =>
                                  _selectedItems[barang.idBarang] = jumlah + 1,
                            )
                          : null,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

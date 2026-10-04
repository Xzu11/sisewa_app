import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/pengembalian_entity.dart';
import '../providers/pengembalian_provider.dart';

class PengembalianFormDialog extends ConsumerStatefulWidget {
  final Map<String, dynamic> penyewaan;

  const PengembalianFormDialog({super.key, required this.penyewaan});

  static Future<bool?> show(
    BuildContext context,
    Map<String, dynamic> penyewaan,
  ) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => PengembalianFormDialog(penyewaan: penyewaan),
    );
  }

  @override
  ConsumerState<PengembalianFormDialog> createState() =>
      _PengembalianFormDialogState();
}

class _PengembalianFormDialogState
    extends ConsumerState<PengembalianFormDialog> {
  final _catatanCtrl = TextEditingController();
  DateTime _tanggalKembali = DateTime.now();
  final Map<int, String> _kondisi = {}; // idBarang -> kondisi
  bool _isLoading = true;
  bool _isSubmitting = false;
  List<Map<String, dynamic>> _items = [];
  final Map<int, TextEditingController> _deskripsiCtrl = {};

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final repo = ref.read(pengembalianRepositoryProvider);
    final items = await repo.getDetailBarang(widget.penyewaan['idSewa']);
    if (!mounted) return;
    setState(() {
      _items = items;
      for (final item in items) {
        _kondisi[item['idBarang'] as int] = 'baik';
        _deskripsiCtrl[item['idBarang'] as int] = TextEditingController();
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    for (final c in _deskripsiCtrl.values) {
      c.dispose();
    }
    _catatanCtrl.dispose();
    super.dispose();
  }

  double get _denda {
    final rencana = widget.penyewaan['tanggalRencanaKembali'] as DateTime;
    if (!_tanggalKembali.isAfter(rencana)) return 0;
    final telatHari = _tanggalKembali.difference(rencana).inDays;
    return telatHari * 10000.0; // Rp 10.000/hari
  }

  double get _biayaPerbaikan {
    double total = 0;
    for (final item in _items) {
      final idBarang = item['idBarang'] as int;
      final jumlah = item['jumlah'] as int;
      final kondisi = _kondisi[idBarang] ?? 'baik';
      final biaya = kondisi == 'rusak_berat'
          ? 100000.0
          : kondisi == 'rusak_ringan'
          ? 20000.0
          : 0.0;
      total += biaya * jumlah;
    }
    return total;
  }

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);

    final items = _items.map((item) {
      final idBarang = item['idBarang'] as int;
      final jumlah = item['jumlah'] as int;
      final kondisi = _kondisi[idBarang] ?? 'baik';
      final biaya = kondisi == 'rusak_berat'
          ? 100000.0 * jumlah
          : kondisi == 'rusak_ringan'
          ? 20000.0 * jumlah
          : 0.0;

      return KondisiItemInput(
        idBarang: idBarang,
        namaBarang: item['namaBarang'] as String,
        jumlah: jumlah,
        kondisi: kondisi,
        deskripsi: _deskripsiCtrl[idBarang]?.text.trim().isEmpty == true
            ? null
            : _deskripsiCtrl[idBarang]?.text.trim(),
        biayaPerbaikan: biaya,
      );
    }).toList();

    final err = await ref
        .read(pengembalianActionProvider.notifier)
        .proses(
          idSewa: widget.penyewaan['idSewa'],
          tanggalDikembalikan: _tanggalKembali,
          denda: _denda,
          catatan: _catatanCtrl.text.trim().isEmpty
              ? null
              : _catatanCtrl.text.trim(),
          idAdmin: null,
          kondisiItems: items,
        );

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (err == null) {
      Navigator.of(context).pop(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cf = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640, maxHeight: 780),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.successBg,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.assignment_return_outlined,
                      color: AppColors.success,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Proses Pengembalian',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          widget.penyewaan['kodeSewa'] as String,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: _isSubmitting
                        ? null
                        : () => Navigator.pop(context, false),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: _isLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(40),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Tanggal
                          InkWell(
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: _tanggalKembali,
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 30),
                                ),
                              );
                              if (picked != null)
                                setState(() => _tanggalKembali = picked);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(14),
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
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tanggal Dikembalikan',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textHint,
                                        ),
                                      ),
                                      Text(
                                        DateFormat(
                                          'dd MMM yyyy',
                                          'id_ID',
                                        ).format(_tanggalKembali),
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
                          ),
                          const SizedBox(height: 16),

                          // List barang + kondisi
                          Text(
                            'Kondisi Barang',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.primary),
                          ),
                          const SizedBox(height: 10),
                          ..._items.map((item) {
                            final idBarang = item['idBarang'] as int;
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item['namaBarang']} (${item['jumlah']}x)',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    DropdownButtonFormField<String>(
                                      initialValue: _kondisi[idBarang],
                                      decoration: const InputDecoration(
                                        labelText: 'Kondisi',
                                        isDense: true,
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'baik',
                                          child: Text('Baik'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'rusak_ringan',
                                          child: Text('Rusak Ringan'),
                                        ),
                                        DropdownMenuItem(
                                          value: 'rusak_berat',
                                          child: Text('Rusak Berat'),
                                        ),
                                      ],
                                      onChanged: (v) => setState(
                                        () => _kondisi[idBarang] = v!,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    TextField(
                                      controller: _deskripsiCtrl[idBarang],
                                      decoration: const InputDecoration(
                                        labelText: 'Deskripsi (opsional)',
                                        isDense: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                          const SizedBox(height: 16),

                          // Catatan
                          TextField(
                            controller: _catatanCtrl,
                            maxLines: 2,
                            decoration: const InputDecoration(
                              labelText: 'Catatan Pengembalian',
                              alignLabelWithHint: true,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Summary
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: AppColors.warningBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                _row('Denda Keterlambatan', cf.format(_denda)),
                                const SizedBox(height: 4),
                                _row(
                                  'Biaya Perbaikan',
                                  cf.format(_biayaPerbaikan),
                                ),
                                const Divider(height: 16),
                                _row(
                                  'Total Tagihan Tambahan',
                                  cf.format(_denda + _biayaPerbaikan),
                                  bold: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isSubmitting
                        ? null
                        : () => Navigator.pop(context, false),
                    child: const Text('Batal'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: _isSubmitting || _isLoading ? null : _submit,
                    icon: _isSubmitting
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Icon(Icons.check_circle_outline, size: 18),
                    label: const Text('Proses Pengembalian'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: bold ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: bold ? 14 : 12,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            color: bold ? AppColors.warning : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

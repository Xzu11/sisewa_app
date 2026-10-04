import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../providers/pembayaran_provider.dart';

class PembayaranFormDialog extends ConsumerStatefulWidget {
  const PembayaranFormDialog({super.key});

  static Future<bool?> show(BuildContext context) => showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (_) => const PembayaranFormDialog(),
  );

  @override
  ConsumerState<PembayaranFormDialog> createState() =>
      _PembayaranFormDialogState();
}

class _PembayaranFormDialogState extends ConsumerState<PembayaranFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _jumlahCtrl = TextEditingController();
  final _keteranganCtrl = TextEditingController();

  int? _idSewa;
  String _jenis = 'dp';
  String _metode = 'transfer';
  bool _isSubmitting = false;

  @override
  void dispose() {
    _jumlahCtrl.dispose();
    _keteranganCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_idSewa == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pilih penyewaan terlebih dahulu'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);
    final err = await ref
        .read(pembayaranActionProvider.notifier)
        .create(
          idSewa: _idSewa!,
          jenisPembayaran: _jenis,
          metodePembayaran: _metode,
          jumlahBayar: double.parse(_jumlahCtrl.text.trim()),
          keterangan: _keteranganCtrl.text.trim().isEmpty
              ? null
              : _keteranganCtrl.text.trim(),
        );

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    if (err == null) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final listAsync = ref.watch(penyewaanBelumLunasProvider);
    final cf = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

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
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primarySurface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.payments_outlined,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'Tambah Pembayaran',
                        style: Theme.of(context).textTheme.titleLarge,
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
                const SizedBox(height: 20),

                // Pilih penyewaan
                listAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error: (e, _) => Text('Error: $e'),
                  data: (items) {
                    if (items.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.infoBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Tidak ada penyewaan yang perlu dibayar',
                          style: TextStyle(color: AppColors.info),
                        ),
                      );
                    }
                    return DropdownButtonFormField<int>(
                      initialValue: _idSewa,
                      decoration: const InputDecoration(
                        labelText: 'Pilih Penyewaan *',
                        prefixIcon: Icon(Icons.receipt_long_outlined),
                      ),
                      items: items
                          .map(
                            (s) => DropdownMenuItem<int>(
                              value: s['idSewa'] as int,
                              child: Text(
                                '${s['kodeSewa']} • Sisa ${cf.format(s['sisaBayar'])}',
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _idSewa = v),
                    );
                  },
                ),
                const SizedBox(height: 14),

                DropdownButtonFormField<String>(
                  initialValue: _jenis,
                  decoration: const InputDecoration(
                    labelText: 'Jenis Pembayaran *',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'dp',
                      child: Text('DP (Uang Muka)'),
                    ),
                    DropdownMenuItem(
                      value: 'pelunasan',
                      child: Text('Pelunasan'),
                    ),
                    DropdownMenuItem(value: 'denda', child: Text('Denda')),
                  ],
                  onChanged: (v) => setState(() => _jenis = v!),
                ),
                const SizedBox(height: 14),

                DropdownButtonFormField<String>(
                  initialValue: _metode,
                  decoration: const InputDecoration(
                    labelText: 'Metode Pembayaran *',
                    prefixIcon: Icon(Icons.payment_outlined),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'transfer',
                      child: Text('Transfer Bank'),
                    ),
                    DropdownMenuItem(value: 'cash', child: Text('Tunai')),
                    DropdownMenuItem(value: 'qris', child: Text('QRIS')),
                  ],
                  onChanged: (v) => setState(() => _metode = v!),
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _jumlahCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Jumlah Bayar (Rp) *',
                    prefixIcon: Icon(Icons.attach_money_outlined),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Wajib diisi';
                    final n = double.tryParse(v);
                    if (n == null || n <= 0) return 'Tidak valid';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                TextFormField(
                  controller: _keteranganCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Keterangan (opsional)',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 24),

                Row(
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
                          : const Icon(Icons.save_outlined, size: 18),
                      label: const Text('Simpan'),
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

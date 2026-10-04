import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/profile_entity.dart';
import '../providers/profile_provider.dart';

class EditProfileDialog extends ConsumerStatefulWidget {
  final ProfileEntity profile;

  const EditProfileDialog({super.key, required this.profile});

  static Future<bool?> show(BuildContext context, ProfileEntity profile) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => EditProfileDialog(profile: profile),
    );
  }

  @override
  ConsumerState<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends ConsumerState<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();

  // Basic info
  late final TextEditingController _namaCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _teleponCtrl;

  // Peminjam info
  late final TextEditingController _nimCtrl;
  late final TextEditingController _kelasCtrl;
  late final TextEditingController _fakultasCtrl;
  late final TextEditingController _jurusanCtrl;
  late final TextEditingController _alamatCtrl;

  // Organisasi info
  late final TextEditingController _namaOrgCtrl;
  late final TextEditingController _singkatanOrgCtrl;
  late final TextEditingController _namaKetuaCtrl;
  late final TextEditingController _namaPembinaCtrl;

  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;

    _namaCtrl = TextEditingController(text: p.namaLengkap);
    _emailCtrl = TextEditingController(text: p.email ?? '');
    _teleponCtrl = TextEditingController(text: p.noTelepon ?? '');

    _nimCtrl = TextEditingController(text: p.nim ?? '');
    _kelasCtrl = TextEditingController(text: p.kelas ?? '');
    _fakultasCtrl = TextEditingController(text: p.fakultas ?? '');
    _jurusanCtrl = TextEditingController(text: p.jurusan ?? '');
    _alamatCtrl = TextEditingController(text: p.alamat ?? '');

    _namaOrgCtrl = TextEditingController(text: p.namaOrganisasi ?? '');
    _singkatanOrgCtrl = TextEditingController(
      text: p.singkatanOrganisasi ?? '',
    );
    _namaKetuaCtrl = TextEditingController(text: p.namaKetua ?? '');
    _namaPembinaCtrl = TextEditingController(text: p.namaPembina ?? '');
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _emailCtrl.dispose();
    _teleponCtrl.dispose();
    _nimCtrl.dispose();
    _kelasCtrl.dispose();
    _fakultasCtrl.dispose();
    _jurusanCtrl.dispose();
    _alamatCtrl.dispose();
    _namaOrgCtrl.dispose();
    _singkatanOrgCtrl.dispose();
    _namaKetuaCtrl.dispose();
    _namaPembinaCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    final p = widget.profile;
    final notifier = ref.read(profileActionProvider.notifier);
    bool ok = true;

    // Update basic info
    ok = await notifier.updateBasicInfo(
      idUser: p.idUser,
      namaLengkap: _namaCtrl.text.trim(),
      email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
      noTelepon: _teleponCtrl.text.trim().isEmpty
          ? null
          : _teleponCtrl.text.trim(),
    );
    if (!ok) {
      _showError('Gagal update data akun');
      return;
    }

    // Update peminjam
    if (p.isPenyewa && p.idPeminjam != null) {
      ok = await notifier.updatePeminjamInfo(
        idPeminjam: p.idPeminjam!,
        nim: _nimCtrl.text.trim(),
        kelas: _kelasCtrl.text.trim(),
        fakultas: _fakultasCtrl.text.trim(),
        jurusan: _jurusanCtrl.text.trim(),
        alamat: _alamatCtrl.text.trim(),
      );
      if (!ok) {
        _showError('Gagal update data mahasiswa');
        return;
      }
    }

    // Update organisasi
    if (p.isAdminOrmawa && p.idOrganisasi != null) {
      ok = await notifier.updateOrganisasiInfo(
        idOrganisasi: p.idOrganisasi!,
        namaOrganisasi: _namaOrgCtrl.text.trim(),
        singkatan: _singkatanOrgCtrl.text.trim(),
        fakultas: _fakultasCtrl.text.trim(),
        jurusan: _jurusanCtrl.text.trim(),
        alamat: _alamatCtrl.text.trim(),
        email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
        noTelepon: _teleponCtrl.text.trim().isEmpty
            ? null
            : _teleponCtrl.text.trim(),
        namaKetua: _namaKetuaCtrl.text.trim(),
        namaPembina: _namaPembinaCtrl.text.trim(),
      );
      if (!ok) {
        _showError('Gagal update data organisasi');
        return;
      }
    }

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    Navigator.of(context).pop(true);
  }

  void _showError(String message) {
    if (!mounted) return;
    setState(() => _isSubmitting = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.profile;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560, maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
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
                      Icons.edit_outlined,
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
                          'Edit Profil',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Ubah data profil Anda',
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

            // FORM
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ===== DATA AKUN =====
                      _sectionHeader('Data Akun'),
                      const SizedBox(height: 12),
                      _readonlyField(
                        label: 'Username',
                        value: p.username,
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email Kampus',
                          hintText: 'nama@student.upnjatim.ac.id',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (v) {
                          // Email boleh kosong saat edit (opsional)
                          if (v == null || v.trim().isEmpty) return null;
                          final email = v.trim().toLowerCase();
                          if (!email.endsWith('@student.upnjatim.ac.id')) {
                            return 'Wajib pakai email @student.upnjatim.ac.id';
                          }
                          final regex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@student\.upnjatim\.ac\.id$',
                          );
                          if (!regex.hasMatch(email)) {
                            return 'Format email tidak valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        controller: _teleponCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'No. Telepon',
                          prefixIcon: Icon(Icons.phone_outlined),
                        ),
                      ),

                      // ===== DATA MAHASISWA (kalau penyewa) =====
                      if (p.isPenyewa) ...[
                        const SizedBox(height: 24),
                        _sectionHeader('Data Mahasiswa'),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _nimCtrl,
                          decoration: const InputDecoration(
                            labelText: 'NIM',
                            prefixIcon: Icon(Icons.numbers_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _kelasCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Kelas',
                            prefixIcon: Icon(Icons.class_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _fakultasCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Fakultas',
                            prefixIcon: Icon(Icons.school_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _jurusanCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Jurusan',
                            prefixIcon: Icon(Icons.book_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _alamatCtrl,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Alamat',
                            prefixIcon: Icon(Icons.home_outlined),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ],

                      // ===== DATA ORGANISASI (kalau admin) =====
                      if (p.isAdminOrmawa) ...[
                        const SizedBox(height: 24),
                        _sectionHeader('Data Organisasi'),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _namaOrgCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Nama Organisasi',
                            prefixIcon: Icon(Icons.business_outlined),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Nama organisasi wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _singkatanOrgCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Singkatan',
                            prefixIcon: Icon(Icons.short_text_rounded),
                          ),
                          validator: (v) => (v == null || v.trim().isEmpty)
                              ? 'Singkatan wajib diisi'
                              : null,
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _namaKetuaCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Nama Ketua',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _namaPembinaCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Nama Pembina',
                            prefixIcon: Icon(Icons.supervisor_account_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _fakultasCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Fakultas',
                            prefixIcon: Icon(Icons.school_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _jurusanCtrl,
                          decoration: const InputDecoration(
                            labelText: 'Jurusan',
                            prefixIcon: Icon(Icons.book_outlined),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _alamatCtrl,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Alamat Sekretariat',
                            prefixIcon: Icon(Icons.home_outlined),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ],
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
                        : const Icon(Icons.save_outlined),
                    label: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String text) => Text(
    text,
    style: Theme.of(context).textTheme.titleMedium
        ?.copyWith(color: AppColors.primary),
  );

  Widget _readonlyField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      enabled: false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }
}

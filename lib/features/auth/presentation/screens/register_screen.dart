import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/repositories/auth_repository.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scrollCtrl = ScrollController();

  // Controllers
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _nimCtrl = TextEditingController();
  final _kelasCtrl = TextEditingController();
  final _fakultasCtrl = TextEditingController();
  final _jurusanCtrl = TextEditingController();
  final _namaOrgCtrl = TextEditingController();
  final _singkatanOrgCtrl = TextEditingController();

  String _role = 'penyewa';
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _scrollCtrl.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    _namaCtrl.dispose();
    _emailCtrl.dispose();
    _teleponCtrl.dispose();
    _nimCtrl.dispose();
    _kelasCtrl.dispose();
    _fakultasCtrl.dispose();
    _jurusanCtrl.dispose();
    _namaOrgCtrl.dispose();
    _singkatanOrgCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();

    final data = RegisterData(
      username: _usernameCtrl.text.trim(),
      password: _passwordCtrl.text,
      namaLengkap: _namaCtrl.text.trim(),
      email: _emailCtrl.text.trim(),
      noTelepon: _teleponCtrl.text.trim(),
      role: _role,
      nim: _role == AppConstants.rolePenyewa ? _nimCtrl.text.trim() : null,
      kelas: _role == AppConstants.rolePenyewa ? _kelasCtrl.text.trim() : null,
      fakultas: _fakultasCtrl.text.trim(),
      jurusan: _jurusanCtrl.text.trim(),
      namaOrganisasi: _role == AppConstants.roleOrmawa
          ? _namaOrgCtrl.text.trim()
          : null,
      singkatanOrganisasi: _role == AppConstants.roleOrmawa
          ? _singkatanOrgCtrl.text.trim()
          : null,
    );

    final success = await ref.read(authProvider.notifier).register(data);

    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil! Selamat datang 🎉'),
          backgroundColor: AppColors.success,
        ),
      );
      // Router otomatis redirect ke Dashboard karena state jadi AuthAuthenticated
    } else {
      final state = ref.read(authProvider);
      final msg = state is AuthError ? state.message : 'Registrasi gagal';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), backgroundColor: AppColors.error),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState is AuthLoading;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Daftar Akun'),
      ),
      body: Center(
        child: SingleChildScrollView(
          controller: _scrollCtrl,
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ====== HEADER ======
                  Text(
                    'Buat Akun Baru',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Pilih jenis akun lalu lengkapi data Anda.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),

                  // ====== PILIH ROLE ======
                  _buildRoleSelector(),
                  const SizedBox(height: 24),

                  // ===== DATA AKUN =====
                  _sectionTitle('Data Akun'),
                  const SizedBox(height: 12),

                  // USERNAME
                  TextFormField(
                    controller: _usernameCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'cth: username123',
                      prefixIcon: Icon(Icons.person_outline_rounded),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return 'Username wajib diisi';
                      if (v.trim().length < 3)
                        return 'Username minimal 3 karakter';
                      if (v.trim().contains(' '))
                        return 'Username tidak boleh pakai spasi';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  // PASSWORD
                  TextFormField(
                    controller: _passwordCtrl,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Password wajib diisi';
                      if (v.length < 6) return 'Password minimal 6 karakter';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  // KONFIRMASI PASSWORD
                  TextFormField(
                    controller: _confirmCtrl,
                    obscureText: _obscureConfirm,
                    decoration: InputDecoration(
                      labelText: 'Konfirmasi Password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        onPressed: () =>
                            setState(() => _obscureConfirm = !_obscureConfirm),
                      ),
                    ),
                    validator: (v) {
                      if (v != _passwordCtrl.text)
                        return 'Password tidak cocok';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // ====== DATA DIRI ======
                  _sectionTitle('Data Diri'),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _namaCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Nama Lengkap',
                      prefixIcon: Icon(Icons.badge_outlined),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Nama lengkap wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'cth: user@student.upnjatim.ac.id',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty)
                        return 'Email wajib diisi';
                      final regex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                      if (!regex.hasMatch(v.trim()))
                        return 'Format email tidak valid';
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _teleponCtrl,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'No. Telepon / WhatsApp',
                      prefixIcon: Icon(Icons.phone_outlined),
                    ),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'No. telepon wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 24),

                  // ====== DATA KHUSUS PER ROLE ======
                  if (_role == AppConstants.rolePenyewa) ..._penyewaFields(),
                  if (_role == AppConstants.roleOrmawa) ..._adminOrmawaFields(),

                  const SizedBox(height: 32),

                  // ====== TOMBOL SUBMIT ======
                  ElevatedButton(
                    onPressed: isLoading ? null : _submit,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : const Text('Daftar Sekarang'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    child: const Text('Sudah punya akun? Masuk'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // WIDGET BANTUAN
  // ============================================================

  Widget _sectionTitle(String text) => Text(
    text,
    style: Theme.of(context).textTheme.titleMedium
        ?.copyWith(color: AppColors.primary),
  );

  Widget _buildRoleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Jenis Akun'),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _roleCard(
                title: 'Penyewa',
                subtitle: 'Sewa barang dari ormawa',
                icon: Icons.shopping_bag_outlined,
                value: AppConstants.rolePenyewa,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _roleCard(
                title: 'Ormawa',
                subtitle: 'Jadi penyedia barang',
                icon: Icons.storefront_outlined,
                value: AppConstants.roleOrmawa,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.infoBg,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, size: 16, color: AppColors.info),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Akun admin hanya bisa dibuat oleh sistem.',
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: AppColors.info),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _roleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required String value,
  }) {
    final selected = _role == value;
    return InkWell(
      onTap: () => setState(() => _role = value),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? AppColors.primarySurface : AppColors.surface,
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 28,
              color: selected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _penyewaFields() {
    return [
      _sectionTitle('Data Mahasiswa'),
      const SizedBox(height: 12),
      TextFormField(
        controller: _nimCtrl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'NIM',
          prefixIcon: Icon(Icons.numbers_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'NIM wajib diisi' : null,
      ),
      const SizedBox(height: 14),
      TextFormField(
        controller: _kelasCtrl,
        decoration: const InputDecoration(
          labelText: 'Kelas',
          prefixIcon: Icon(Icons.class_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Kelas wajib diisi' : null,
      ),
      const SizedBox(height: 14),
      TextFormField(
        controller: _fakultasCtrl,
        decoration: const InputDecoration(
          labelText: 'Fakultas',
          prefixIcon: Icon(Icons.school_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Fakultas wajib diisi' : null,
      ),
      const SizedBox(height: 14),
      TextFormField(
        controller: _jurusanCtrl,
        decoration: const InputDecoration(
          labelText: 'Jurusan / Program Studi',
          prefixIcon: Icon(Icons.book_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Jurusan wajib diisi' : null,
      ),
    ];
  }

  List<Widget> _adminOrmawaFields() {
    return [
      _sectionTitle('Data Organisasi'),
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
          labelText: 'Singkatan (cth: BEM, HMIF)',
          prefixIcon: Icon(Icons.short_text_rounded),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Singkatan wajib diisi' : null,
      ),
      const SizedBox(height: 14),
      TextFormField(
        controller: _fakultasCtrl,
        decoration: const InputDecoration(
          labelText: 'Fakultas',
          prefixIcon: Icon(Icons.school_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Fakultas wajib diisi' : null,
      ),
      const SizedBox(height: 14),
      TextFormField(
        controller: _jurusanCtrl,
        decoration: const InputDecoration(
          labelText: 'Jurusan / Program Studi',
          prefixIcon: Icon(Icons.book_outlined),
        ),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? 'Jurusan wajib diisi' : null,
      ),
    ];
  }
}

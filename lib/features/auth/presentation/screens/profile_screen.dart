import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/profile_entity.dart';
import '../providers/auth_provider.dart';
import '../providers/profile_provider.dart';
import '../widgets/change_password_dialog.dart';
import '../widgets/edit_profile_dialog.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 64,
                  color: AppColors.error,
                ),
                const SizedBox(height: 16),
                Text('Gagal memuat profil: $e'),
              ],
            ),
          ),
        ),
        data: (profile) {
          if (profile == null) {
            return const Center(child: Text('Profil tidak ditemukan'));
          }
          return _buildContent(context, ref, profile);
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    ProfileEntity profile,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ===== HEADER CARD =====
              _headerCard(context, ref, profile),
              const SizedBox(height: 20),

              // ===== DATA AKUN =====
              _sectionCard(
                title: 'Data Akun',
                icon: Icons.person_outline,
                children: [
                  _infoRow('Username', profile.username),
                  _infoRow('Nama Lengkap', profile.namaLengkap),
                  _infoRow('Email', profile.email ?? '-'),
                  _infoRow('No. Telepon', profile.noTelepon ?? '-'),
                  _infoRow('Status', profile.status, capitalize: true),
                  _infoRow(
                    'Terakhir Login',
                    profile.lastLogin != null
                        ? DateFormat(
                            'dd MMM yyyy, HH:mm',
                            'id_ID',
                          ).format(profile.lastLogin!)
                        : '-',
                  ),
                  _infoRow(
                    'Terdaftar Sejak',
                    DateFormat(
                      'dd MMM yyyy',
                      'id_ID',
                    ).format(profile.createdAt),
                  ),
                ],
              ),

              // ===== DATA MAHASISWA (penyewa) =====
              if (profile.isPenyewa) ...[
                const SizedBox(height: 16),
                _sectionCard(
                  title: 'Data Mahasiswa',
                  icon: Icons.school_outlined,
                  children: [
                    _infoRow('NIM', profile.nim ?? '-'),
                    _infoRow('Kelas', profile.kelas ?? '-'),
                    _infoRow('Fakultas', profile.fakultas ?? '-'),
                    _infoRow('Jurusan', profile.jurusan ?? '-'),
                    _infoRow('Alamat', profile.alamat ?? '-'),
                  ],
                ),
              ],

              // ===== DATA ORGANISASI (admin ormawa) =====
              if (profile.isAdminOrmawa) ...[
                const SizedBox(height: 16),
                _sectionCard(
                  title: 'Data Organisasi',
                  icon: Icons.business_outlined,
                  children: [
                    _infoRow('Nama Organisasi', profile.namaOrganisasi ?? '-'),
                    _infoRow('Singkatan', profile.singkatanOrganisasi ?? '-'),
                    _infoRow('Jabatan', profile.jabatan ?? '-'),
                    _infoRow('Nama Ketua', profile.namaKetua ?? '-'),
                    _infoRow('Nama Pembina', profile.namaPembina ?? '-'),
                    _infoRow('Fakultas', profile.fakultas ?? '-'),
                    _infoRow('Jurusan', profile.jurusan ?? '-'),
                    _infoRow('Alamat', profile.alamat ?? '-'),
                  ],
                ),
              ],

              const SizedBox(height: 24),

              // ===== LOGOUT BUTTON =====
              OutlinedButton.icon(
                onPressed: () => _handleLogout(context, ref),
                icon: const Icon(Icons.logout_rounded, color: AppColors.error),
                label: const Text(
                  'Logout',
                  style: TextStyle(color: AppColors.error),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerCard(
    BuildContext context,
    WidgetRef ref,
    ProfileEntity profile,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 3),
              ),
              alignment: Alignment.center,
              child: Text(
                profile.namaLengkap.isNotEmpty
                    ? profile.namaLengkap[0].toUpperCase()
                    : '?',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama
            Text(
              profile.namaLengkap,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),

            // Role badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primarySurface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                profile.roleLabel,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await EditProfileDialog.show(
                      context,
                      profile,
                    );
                    if (result == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profil berhasil diperbarui'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Edit Profil'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () async {
                    final result = await ChangePasswordDialog.show(
                      context,
                      profile.idUser,
                    );
                    if (result == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password berhasil diubah'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.lock_outline, size: 18),
                  label: const Text('Ubah Password'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.primary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, {bool capitalize = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          const Text(':  ', style: TextStyle(color: AppColors.textSecondary)),
          Expanded(
            child: Text(
              capitalize && value.isNotEmpty
                  ? '${value[0].toUpperCase()}${value.substring(1)}'
                  : value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      if (context.mounted) Navigator.of(context).pop();
      await ref.read(authProvider.notifier).logout();
    }
  }
}

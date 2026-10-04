import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../../features/auth/domain/entities/user_entity.dart';

class AppTopbar extends StatelessWidget {
  final UserEntity? user;
  final VoidCallback? onToggleSidebar;
  final VoidCallback onProfileTap;
  final VoidCallback onLogoutTap;

  const AppTopbar({
    super.key,
    required this.user,
    required this.onProfileTap,
    required this.onLogoutTap,
    this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // ===== TOGGLE SIDEBAR =====
          if (onToggleSidebar != null)
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              tooltip: 'Toggle sidebar',
              onPressed: onToggleSidebar,
            ),

          // ===== TITLE =====
          const SizedBox(width: 4),
          Text(
            'Sistem Informasi Penyewaan Barang Ormawa',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const Spacer(),

          // ===== NOTIFIKASI =====
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifikasi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fitur notifikasi segera hadir')),
              );
            },
          ),

          const SizedBox(width: 8),

          // ===== PROFILE DROPDOWN =====
          PopupMenuButton<String>(
            tooltip: 'Profil',
            offset: const Offset(0, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onSelected: (value) {
              if (value == 'profile') onProfileTap();
              if (value == 'logout') onLogoutTap();
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    const Icon(Icons.person_outline, size: 18),
                    const SizedBox(width: 10),
                    const Text('Profil Saya'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout_rounded,
                      size: 18,
                      color: AppColors.error,
                    ),
                    SizedBox(width: 10),
                    Text('Logout', style: TextStyle(color: AppColors.error)),
                  ],
                ),
              ),
            ],
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.primarySurface,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _initial(user?.namaLengkap),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user?.namaLengkap ?? 'Guest',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        _roleLabel(user?.role),
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _initial(String? name) {
    if (name == null || name.isEmpty) return '?';
    return name.trim()[0].toUpperCase();
  }

  String _roleLabel(String? role) {
    switch (role) {
      case 'admin_ormawa':
        return 'Admin Ormawa';
      case 'admin_siswa':
        return 'Admin Siswa';
      case 'penyewa':
        return 'Penyewa';
      default:
        return 'Pengguna';
    }
  }
}

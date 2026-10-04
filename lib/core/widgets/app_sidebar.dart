import 'package:flutter/material.dart';

import '../constants/menu_items.dart';
import '../theme/app_colors.dart';

class AppSidebar extends StatelessWidget {
  final bool collapsed;
  final String activeRoute;
  final List<MenuItem> menus;
  final ValueChanged<String> onMenuTap;
  final VoidCallback? onToggleCollapse;
  final VoidCallback onLogout;

  const AppSidebar({
    super.key,
    required this.collapsed,
    required this.activeRoute,
    required this.menus,
    required this.onMenuTap,
    required this.onLogout,
    this.onToggleCollapse,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: collapsed ? 72 : 240,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(right: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Column(
        children: [
          // ===== HEADER LOGO =====
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: collapsed ? 16 : 20),
            alignment: collapsed ? Alignment.center : Alignment.centerLeft,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.inventory_2_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                if (!collapsed) ...[
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'SISEWA',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          'Penyewaan Ormawa',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.divider),

          // ===== MENU LIST =====
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                final isActive = activeRoute == menu.route;
                return _menuItem(menu, isActive);
              },
            ),
          ),

          // ===== FOOTER =====
          const Divider(height: 1, color: AppColors.divider),
          _footerButton(
            icon: Icons.logout_rounded,
            label: 'Logout',
            onTap: onLogout,
            color: AppColors.error,
            tooltip: collapsed ? 'Logout' : null,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _menuItem(MenuItem menu, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: isActive ? AppColors.primarySurface : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => onMenuTap(menu.route),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: collapsed ? 0 : 14),
            alignment: collapsed ? Alignment.center : Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: collapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(
                  menu.icon,
                  size: 20,
                  color: isActive ? AppColors.primary : AppColors.textSecondary,
                ),
                if (!collapsed) ...[
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      menu.label,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: isActive
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: isActive
                            ? AppColors.primary
                            : AppColors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _footerButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color? color,
    String? tooltip,
  }) {
    final button = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: collapsed ? 0 : 14),
            alignment: collapsed ? Alignment.center : Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: collapsed
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Icon(icon, size: 20, color: color ?? AppColors.textSecondary),
                if (!collapsed) ...[
                  const SizedBox(width: 14),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: color ?? AppColors.textPrimary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
    if (tooltip != null) {
      return Tooltip(message: tooltip, child: button);
    }
    return button;
  }
}

import 'package:flutter/material.dart';

import 'app_constants.dart';

class MenuItem {
  final String label;
  final IconData icon;
  final String route;
  final List<String> allowedRoles;

  const MenuItem({
    required this.label,
    required this.icon,
    required this.route,
    this.allowedRoles = const [],
  });

  bool isVisibleFor(String role) {
    if (allowedRoles.isEmpty) return true;
    return allowedRoles.contains(role);
  }
}

class AppMenus {
  AppMenus._();

  static const List<MenuItem> items = [
    MenuItem(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      route: '/dashboard',
    ),
    MenuItem(
      label: 'Barang',
      icon: Icons.inventory_2_outlined,
      route: '/barang',
      allowedRoles: [AppConstants.roleAdminOrmawa, AppConstants.roleAdminSiswa],
    ),
    MenuItem(
      label: 'Kategori',
      icon: Icons.category_outlined,
      route: '/kategori',
      allowedRoles: [AppConstants.roleAdminOrmawa, AppConstants.roleAdminSiswa],
    ),
    MenuItem(
      label: 'Penyewaan',
      icon: Icons.assignment_outlined,
      route: '/penyewaan',
    ),
    MenuItem(
      label: 'Pengembalian',
      icon: Icons.assignment_return_outlined,
      route: '/pengembalian',
      allowedRoles: [AppConstants.roleAdminOrmawa, AppConstants.roleAdminSiswa],
    ),
    MenuItem(
      label: 'Pembayaran',
      icon: Icons.payments_outlined,
      route: '/pembayaran',
    ),
    MenuItem(
      label: 'Laporan',
      icon: Icons.bar_chart_outlined,
      route: '/laporan',
      allowedRoles: [AppConstants.roleAdminOrmawa, AppConstants.roleAdminSiswa],
    ),
    MenuItem(
      label: 'Pengguna',
      icon: Icons.people_outline,
      route: '/pengguna',
      allowedRoles: [AppConstants.roleAdminOrmawa],
    ),
  ];
}

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
    // ===== SEMUA ROLE =====
    MenuItem(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      route: '/dashboard',
    ),

    // ===== ADMIN & ORMAWA: Kelola Barang =====
    MenuItem(
      label: 'Barang Saya',
      icon: Icons.inventory_2_outlined,
      route: '/barang',
      allowedRoles: [AppConstants.roleAdmin, AppConstants.roleOrmawa],
    ),

    // ===== PENYEWA: Katalog Barang =====
    MenuItem(
      label: 'Katalog Barang',
      icon: Icons.storefront_outlined,
      route: '/katalog',
      allowedRoles: [AppConstants.rolePenyewa],
    ),

    // ===== ADMIN ONLY: Kategori =====
    MenuItem(
      label: 'Kategori',
      icon: Icons.category_outlined,
      route: '/kategori',
      allowedRoles: [AppConstants.roleAdmin],
    ),

    // ===== SEMUA ROLE: Penyewaan =====
    MenuItem(
      label: 'Penyewaan',
      icon: Icons.assignment_outlined,
      route: '/penyewaan',
    ),

    // ===== ADMIN & ORMAWA: Pengembalian =====
    MenuItem(
      label: 'Pengembalian',
      icon: Icons.assignment_return_outlined,
      route: '/pengembalian',
      allowedRoles: [AppConstants.roleAdmin, AppConstants.roleOrmawa],
    ),

    // ===== SEMUA ROLE: Pembayaran =====
    MenuItem(
      label: 'Pembayaran',
      icon: Icons.payments_outlined,
      route: '/pembayaran',
    ),

    // ===== ADMIN & ORMAWA: Laporan =====
    MenuItem(
      label: 'Laporan',
      icon: Icons.bar_chart_outlined,
      route: '/laporan',
      allowedRoles: [AppConstants.roleAdmin, AppConstants.roleOrmawa],
    ),

    // ===== ADMIN ONLY: Pengguna =====
    MenuItem(
      label: 'Pengguna',
      icon: Icons.people_outline,
      route: '/pengguna',
      allowedRoles: [AppConstants.roleAdmin],
    ),
  ];
}

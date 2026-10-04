import 'package:flutter/material.dart';

class PenggunaScreen extends StatelessWidget {
  const PenggunaScreen({super.key});
  @override
  Widget build(BuildContext context) => const _Placeholder(title: 'Pengguna');
}

class _Placeholder extends StatelessWidget {
  final String title;
  const _Placeholder({required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.construction_rounded, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Halaman $title',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          const Text('Segera hadir...'),
        ],
      ),
    );
  }
}

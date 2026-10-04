import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../data/repositories/barang_repository_impl.dart';
import '../../domain/entities/barang_entity.dart';
import '../../domain/repositories/barang_repository.dart';

final barangRepositoryProvider = Provider<BarangRepository>((ref) {
  return BarangRepositoryImpl(ref.watch(databaseProvider));
});

class BarangState {
  final List<BarangEntity> items;
  final bool isLoading;
  final String? error;
  final String searchQuery;
  final int? filterKategoriId;

  const BarangState({
    this.items = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
    this.filterKategoriId,
  });

  BarangState copyWith({
    List<BarangEntity>? items,
    bool? isLoading,
    String? error,
    String? searchQuery,
    int? filterKategoriId,
    bool clearError = false,
    bool clearFilter = false,
  }) {
    return BarangState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      searchQuery: searchQuery ?? this.searchQuery,
      filterKategoriId: clearFilter
          ? null
          : (filterKategoriId ?? this.filterKategoriId),
    );
  }
}

class BarangNotifier extends Notifier<BarangState> {
  BarangRepository get _repo => ref.read(barangRepositoryProvider);

  @override
  BarangState build() {
    Future.microtask(() => load());
    return const BarangState(isLoading: true);
  }

  Future<void> load({
    String? search,
    int? idKategori,
    bool clearFilter = false,
  }) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      searchQuery: search ?? state.searchQuery,
      filterKategoriId: clearFilter
          ? null
          : (idKategori ?? state.filterKategoriId),
      clearFilter: clearFilter,
    );
    try {
      final items = await _repo.getAll(
        search: state.searchQuery,
        idKategori: state.filterKategoriId,
      );
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<bool> create({
    required int idKategori,
    required int idOrganisasi,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  }) async {
    try {
      final taken = await _repo.isNamaTaken(namaBarang);
      if (taken) {
        state = state.copyWith(error: 'Barang "$namaBarang" sudah ada');
        return false;
      }
      await _repo.create(
        idKategori: idKategori,
        idOrganisasi: idOrganisasi,
        namaBarang: namaBarang,
        deskripsi: deskripsi,
        fotoBarang: fotoBarang,
        stokTotal: stokTotal,
        stokTersedia: stokTersedia,
        kondisi: kondisi,
      );
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal menambah: $e');
      return false;
    }
  }

  Future<bool> update({
    required int idBarang,
    required int idKategori,
    required String namaBarang,
    String? deskripsi,
    String? fotoBarang,
    required int stokTotal,
    required int stokTersedia,
    required String kondisi,
  }) async {
    try {
      final taken = await _repo.isNamaTaken(namaBarang, excludeId: idBarang);
      if (taken) {
        state = state.copyWith(error: 'Barang "$namaBarang" sudah ada');
        return false;
      }
      await _repo.update(
        idBarang: idBarang,
        idKategori: idKategori,
        namaBarang: namaBarang,
        deskripsi: deskripsi,
        fotoBarang: fotoBarang,
        stokTotal: stokTotal,
        stokTersedia: stokTersedia,
        kondisi: kondisi,
      );
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal mengubah: $e');
      return false;
    }
  }

  Future<bool> delete(int idBarang) async {
    try {
      await _repo.softDelete(idBarang);
      await load();
      return true;
    } catch (e) {
      state = state.copyWith(error: 'Gagal menghapus: $e');
      return false;
    }
  }
}

final barangProvider = NotifierProvider<BarangNotifier, BarangState>(
  () => BarangNotifier(),
);

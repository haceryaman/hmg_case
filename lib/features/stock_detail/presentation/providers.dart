import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hmg_case/features/service/dio_client.dart';
import 'package:hmg_case/features/stock_detail/presentation/viewmodel/inventory_list_viewmodel.dart';
import '../data/datasources/inventory_remote_datasource.dart';
import '../data/repositories/inventory_repository_impl.dart';
import '../domain/usecases/start_inventory_counting.dart';
import '../domain/repositories/inventory_repository.dart';

final remoteDsProvider = Provider<InventoryRemoteDataSource>(
      (ref) => InventoryRemoteDataSourceImpl(ref.read(dioProvider)),
);

final inventoryRepoProvider = Provider<InventoryRepository>(
      (ref) => InventoryRepositoryImpl(ref.read(remoteDsProvider)),
);

final startCountingUseCaseProvider = Provider(
      (ref) => StartInventoryCounting(ref.read(inventoryRepoProvider)),
);

final loadingIdsProvider = StateNotifierProvider<
    InventoryListViewModel, Set<int>>((ref) {
  return InventoryListViewModel(
    ref.read(startCountingUseCaseProvider),
  );
});

import '../../domain/repositories/inventory_repository.dart';
import '../datasources/inventory_remote_datasource.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remote;
  InventoryRepositoryImpl(this._remote);

  @override
  Future<void> startCounting(int id) =>
      _remote.startCounting(id);
}

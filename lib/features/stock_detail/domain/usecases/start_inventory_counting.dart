import '../repositories/inventory_repository.dart';

class StartInventoryCounting {
  final InventoryRepository _repo;

  StartInventoryCounting(this._repo);

  Future<void> call(int id) => _repo.startCounting(id);
}

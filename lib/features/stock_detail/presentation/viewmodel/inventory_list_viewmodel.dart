import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/start_inventory_counting.dart';

class InventoryListViewModel extends StateNotifier<Set<int>> {
  final StartInventoryCounting _startUc;
  InventoryListViewModel(this._startUc) : super({});

  Future<void> startCounting(int id) async {
    state = {...state, id};
    try {
      await _startUc(id);
    } finally {
      state = {...state}..remove(id);
    }
  }
}

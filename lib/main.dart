import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/stock_detail/presentation/pages/inventory_tasks_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Inventory App',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const InventoryTasksPage(),
  );
}

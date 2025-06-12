import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../providers.dart';
import 'inventory_tasks_detail_page.dart';

class InventoryTasksPage extends ConsumerStatefulWidget {
  const InventoryTasksPage({super.key});

  @override
  ConsumerState<InventoryTasksPage> createState() => _InventoryTasksPageState();
}

class _InventoryTasksPageState extends ConsumerState<InventoryTasksPage> {
  final List<Task> _tasks = List.generate(
    6,
    (i) => Task(i + 1, 'July Stok Sayımı'),
  );

  @override
  Widget build(BuildContext context) {
    final loadingIds = ref.watch(loadingIdsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001529),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Inventariserende taken',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Ahmet Aydın',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Vandaag 09.08.2023',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {},
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade500, width: 2),
                ),
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: _tasks.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, idx) {
                  final task = _tasks[idx];
                  final isLoading = loadingIds.contains(task.id);

                  return Card(
                    color: const Color(0xFFf4fbff),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        // 1) Kart içeriği
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '09.08.2023',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'Code: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(text: '${task.id}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                task.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 4),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Magazijn: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: 'Eindhoven'),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Totaalproduct: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: '657'),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Type: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: 'FULL'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 12,
                          right: 12,
                          child:
                              isLoading
                                  ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                  : SizedBox(
                                    height: 24,
                                    width: 90,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        backgroundColor: Colors.blue,
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (_) =>
                                            const InventoryTaskDetailPage(),
                                          ),
                                        );
                                        await ref
                                            .read(loadingIdsProvider.notifier)
                                            .startCounting(task.id);

                                      },
                                      child: const Text(
                                        'Begin',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

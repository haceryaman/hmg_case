import 'package:flutter/material.dart';

class InventoryTaskDetailPage extends StatelessWidget {
  const InventoryTaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(6, (i) {
      return {
        'image': 'https://via.placeholder.com/60',
        'title': 'Swiss Colectie Duvet',
        'subtitle': '180 cm x 270 cm premium',
        'qty': 126 + i * 5,
        'counted': 85 + i * 3,
      };
    });

    final headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF001529),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          'Inventariserende taken',
          style: TextStyle(color: Colors.white, fontSize: 16),
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
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              height: 140,
              color: Colors.teal.shade50,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline, size: 56, color: Colors.teal),
                  SizedBox(width: 48),
                  const Text(
                    'Scan eerst\nde locatie',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _StatItem(label: 'Total quantity', value: '1698'),
                  _StatItem(label: 'Counted quantity', value: '346'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Header
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.shade50,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text('Img', style: headerStyle),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text('Titel', style: headerStyle),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Loc.',
                            textAlign: TextAlign.start,
                            style: headerStyle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Qty',
                            textAlign: TextAlign.start,
                            style: headerStyle,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Graaf',
                            textAlign: TextAlign.start,
                            style: headerStyle,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rows
                  Expanded(
                    child: ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 0),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        final bgColor =
                            index.isOdd
                                ? Colors.lightBlue.shade50
                                : Colors.white;

                        return Container(
                          color: bgColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  "lib/assets/images/img.png",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),

                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Swiss Colectie\nDuvet 180 cm x 270 cm premium",
                                      style: TextStyle(
                                        fontSize: 13
                                      )
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  "lib/assets/images/img2.jpg",
                                  height: 18,
                                  width: 68,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${item['qty']}',
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Text(
                                  '${item['counted']}',
                                  textAlign: TextAlign.center,
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
          ),
        ],
      ),

      // --- Bottom bar ---
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save, color: Colors.white),
          label: const Text('Redden', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label, value;

  const _StatItem({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.black)),
        const SizedBox(height: 8),
        Text(value, style: TextStyle(fontSize: 52)),
      ],
    );
  }
}

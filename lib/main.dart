import 'package:flutter/material.dart';

void main() {
  runApp(const PCBuilderApp());
}

class PCBuilderApp extends StatelessWidget {
  const PCBuilderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iraq PC Builder',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E676),
          secondary: Color(0xFF7C4DFF),
        ),
      ),
      home: const AllPartsScreen(),
    );
  }
}

class AllPartsScreen extends StatelessWidget {
  const AllPartsScreen({super.key});

  // تم تصحيح نوع البيانات هنا بدقة لتفادي خطأ البناء
  final List> pcParts = const [
    {
      'category': 'معالج (CPU)',
      'name': 'Intel Core i7-14700K',
      'priceIQD': 540000,
      'priceUSD': 329,
      'image': 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=500',
    },
    {
      'category': 'لوحة أم (Motherboard)',
      'name': 'ASUS ROG Strix Z790-E',
      'priceIQD': 490000,
      'priceUSD': 299,
      'image': 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=500',
    },
    {
      'category': 'كيس (PC Case)',
      'name': 'NZXT H9 Flow RGB',
      'priceIQD': 260000,
      'priceUSD': 159,
      'image': 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=500',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة القطع المتوفرة', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: pcParts.length,
        itemBuilder: (context, index) {
          final part = pcParts[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      part['image'] as String, // تم تحديد النوع كـ String بدقة
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const SizedBox(
                          width: 90,
                          height: 90,
                          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          part['category'] as String,
                          style: const TextStyle(color: Color(0xFFB388FF), fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          part['name'] as String,
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${part['priceUSD']} \$ | ${part['priceIQD']} د.ع',
                          style: const TextStyle(color: Color(0xFF00E676), fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() => runApp(const BuildSetupApp());

const purple = Color(0xFF9B8CFF);
const background = Color(0xFF090C16);
const panel = Color(0xFF171D30);

// سعر صرف افتراضي قابل للتغيير، وليس سعراً لحظياً.
const double usdRate = 1500;

class Product {
  final String category;
  final String name;
  final String brand;
  final int priceIQD;
  final String details;
  final String imageUrl;
  final String socket;
  final String ramType;

  const Product({
    required this.category,
    required this.name,
    required this.brand,
    required this.priceIQD,
    required this.details,
    required this.imageUrl,
    this.socket = '',
    this.ramType = '',
  });

  double get priceUSD => priceIQD / usdRate;
}

const products = <Product>[
  Product(
    category: 'CPU',
    name: 'Intel Core i5-13400F',
    brand: 'Intel',
    priceIQD: 210000,
    details: '10 Cores / 16 Threads',
    imageUrl: 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=500',
    socket: 'LGA1700',
  ),
  Product(
    category: 'CPU',
    name: 'AMD Ryzen 5 7600',
    brand: 'AMD',
    priceIQD: 205000,
    details: '6 Cores / 12 Threads',
    imageUrl: 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=500',
    socket: 'AM5',
  ),
  Product(
    category: 'CPU',
    name: 'AMD Ryzen 7 7800X3D',
    brand: 'AMD',
    priceIQD: 520000,
    details: 'Gaming Processor',
    imageUrl: 'https://images.unsplash.com/photo-1591799264318-7e6ef8ddb7ea?w=500',
    socket: 'AM5',
  ),
  Product(
    category: 'GPU',
    name: 'NVIDIA RTX 4060 8GB',
    brand: 'NVIDIA',
    priceIQD: 320000,
    details: '8GB Graphics Card',
    imageUrl: 'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=500',
  ),
  Product(
    category: 'GPU',
    name: 'NVIDIA RTX 4070 SUPER',
    brand: 'NVIDIA',
    priceIQD: 780000,
    details: '12GB Graphics Card',
    imageUrl: 'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=500',
  ),
  Product(
    category: 'GPU',
    name: 'AMD Radeon RX 7800 XT',
    brand: 'AMD',
    priceIQD: 850000,
    details: '16GB Graphics Card',
    imageUrl: 'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=500',
  ),
  Product(
    category: 'Motherboard',
    name: 'Gigabyte B760M Gaming AC DDR4',
    brand: 'Gigabyte',
    priceIQD: 210000,
    details: 'LGA1700 / DDR4',
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=500',
    socket: 'LGA1700',
    ramType: 'DDR4',
  ),
  Product(
    category: 'Motherboard',
    name: 'Gigabyte B650M',
    brand: 'Gigabyte',
    priceIQD: 230000,
    details: 'AM5 / DDR5',
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=500',
    socket: 'AM5',
    ramType: 'DDR5',
  ),
  Product(
    category: 'RAM',
    name: '32GB DDR4 3200MHz',
    brand: 'Kingston',
    priceIQD: 135000,
    details: '2 x 16GB',
    imageUrl: 'https://images.unsplash.com/photo-1562976540-1502c2145186?w=500',
    ramType: 'DDR4',
  ),
  Product(
    category: 'RAM',
    name: '32GB DDR5 6000MHz',
    brand: 'Kingston',
    priceIQD: 185000,
    details: '2 x 16GB',
    imageUrl: 'https://images.unsplash.com/photo-1562976540-1502c2145186?w=500',
    ramType: 'DDR5',
  ),
  Product(
    category: 'Storage',
    name: 'NVMe SSD 1TB',
    brand: 'Western Digital',
    priceIQD: 75000,
    details: 'M.2 NVMe',
    imageUrl: 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=500',
  ),
  Product(
    category: 'PSU',
    name: '750W 80+ Bronze',
    brand: 'Gigabyte',
    priceIQD: 80000,
    details: '750 Watt',
    imageUrl: 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=500',
  ),
  Product(
    category: 'Case',
    name: 'DarkFlash C280 7-Fan',
    brand: 'DarkFlash',
    priceIQD: 150000,
    details: 'Black Gaming Case',
    imageUrl: 'https://images.unsplash.com/photo-1587202372634-32705e3bf49c?w=500',
  ),
  Product(
    category: 'Cooling',
    name: 'DeepCool Gammaxx AG400',
    brand: 'DeepCool',
    priceIQD: 40000,
    details: 'CPU Air Cooler',
    imageUrl: 'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=500',
  ),
  Product(
    category: 'Monitor',
    name: 'ASUS TUF 24-inch 200Hz',
    brand: 'ASUS',
    priceIQD: 185000,
    details: 'FHD Gaming Monitor',
    imageUrl: 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=500',
  ),
  Product(
    category: 'Keyboard',
    name: 'Mechanical RGB Keyboard',
    brand: 'Jertech',
    priceIQD: 40000,
    details: 'Mechanical / RGB',
    imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=500',
  ),
  Product(
    category: 'Mouse',
    name: 'Gaming Mouse',
    brand: 'Attack Shark',
    priceIQD: 60000,
    details: 'Gaming Mouse',
    imageUrl: 'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500',
  ),
];

const categories = <String, String>{
  'CPU': 'المعالجات',
  'GPU': 'كروت الشاشة',
  'Motherboard': 'اللوحات الأم',
  'RAM': 'الرامات',
  'Storage': 'التخزين',
  'PSU': 'مزودات الطاقة',
  'Case': 'الكيسات',
  'Cooling': 'التبريد',
  'Monitor': 'الشاشات',
  'Keyboard': 'الكيبوردات',
  'Mouse': 'الماوسات',
};

const categoryIcons = <String, IconData>{
  'CPU': Icons.memory,
  'GPU': Icons.videogame_asset,
  'Motherboard': Icons.developer_board,
  'RAM': Icons.sd_storage,
  'Storage': Icons.storage,
  'PSU': Icons.bolt,
  'Case': Icons.desktop_windows,
  'Cooling': Icons.ac_unit,
  'Monitor': Icons.monitor,
  'Keyboard': Icons.keyboard,
  'Mouse': Icons.mouse,
};

class BuildSetupApp extends StatelessWidget {
  const BuildSetupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Build Setup',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: purple,
          brightness: Brightness.dark,
        ),
      ),
      home: const CatalogPage(),
    );
  }
}

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  String selectedCategory = '';
  String query = '';
  final searchController = TextEditingController();
  final Map<String, Product> build = {};

  String money(int value) {
    final text = value.toString();
    final out = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && (text.length - i) % 3 == 0) {
        out.write(',');
      }
      out.write(text[i]);
    }
    return '${out.toString()} د.ع';
  }

  String dollars(double value) => '\$${value.toStringAsFixed(2)}';

  int get total =>
      build.values.fold(0, (sum, product) => sum + product.priceIQD);

  List<Product> get visibleProducts {
    return products.where((product) {
      final categoryMatch = selectedCategory.isEmpty ||
          product.category == selectedCategory;
      final q = query.toLowerCase();
      final searchMatch = product.name.toLowerCase().contains(q) ||
          product.brand.toLowerCase().contains(q);
      return categoryMatch && searchMatch;
    }).toList();
  }

  void selectProduct(Product product) {
    setState(() {
      build[product.category] = product;
    });
  }

  void showProduct(Product product) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: panel,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(
                    product.imageUrl,
                    height: 190,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SizedBox(
                      height: 150,
                      child: Center(
                        child: Icon(Icons.image_not_supported, size: 55),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(product.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                Text('${product.brand} • ${product.details}'),
                const SizedBox(height: 12),
                Text(money(product.priceIQD),
                    style: const TextStyle(color: purple, fontSize: 22)),
                Text(dollars(product.priceUSD),
                    style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      selectProduct(product);
                      Navigator.pop(sheetContext);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('اختيار القطعة'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('3D Build Setup',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: 'مسح التجميعة',
              onPressed: () => setState(() => build.clear()),
              icon: const Icon(Icons.restart_alt),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF29264F), Color(0xFF151A2B)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ابنِ تجميعة أحلامك',
                      style: TextStyle(
                          fontSize: 27, fontWeight: FontWeight.w900)),
                  const SizedBox(height: 8),
                  const Text('قطع الكمبيوتر وإكسسوارات الألعاب بمكان واحد'),
                  const SizedBox(height: 18),
                  Text('القطع المختارة: ${build.length}'),
                  const SizedBox(height: 5),
                  Text(money(total),
                      style: const TextStyle(
                          fontSize: 24,
                          color: purple,
                          fontWeight: FontWeight.bold)),
                  Text(dollars(total / usdRate),
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('أولاً: اختَر القسم',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.1,
              children: categories.entries.map((entry) {
                final active = selectedCategory == entry.key;
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => setState(() {
                    selectedCategory = active ? '' : entry.key;
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: active ? const Color(0xFF302B58) : panel,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: active ? purple : Colors.white12,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(categoryIcons[entry.key], color: purple),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(entry.value,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text('ثانياً: اختَر القطعة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              controller: searchController,
              onChanged: (value) => setState(() => query = value),
              decoration: InputDecoration(
                hintText: 'ابحث عن الموديل أو الماركة...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: panel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 14),
            if (visibleProducts.isEmpty)
              const Center(child: Text('لا توجد نتائج لهذا البحث')),
            ...visibleProducts.map((product) {
              final isSelected =
                  build[product.category]?.name == product.name;
              return Card(
                color: panel,
                margin: const EdgeInsets.only(bottom: 12),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () => showProduct(product),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 112,
                        height: 125,
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Center(
                            child: Icon(Icons.image_not_supported, size: 38),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(product.brand,
                                  style: const TextStyle(
                                      color: Colors.white60)),
                              const SizedBox(height: 8),
                              Text(money(product.priceIQD),
                                  style: const TextStyle(
                                      color: purple,
                                      fontWeight: FontWeight.bold)),
                              Text(dollars(product.priceUSD),
                                  style: const TextStyle(
                                      color: Colors.white70)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () => selectProduct(product),
                                  icon: Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.add_circle,
                                    color: isSelected
                                        ? Colors.greenAccent
                                        : purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 15),
            const Text('تجميعتك الحالية',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            if (build.isEmpty)
              const Text('اختَر قطعة من الكتالوج حتى تظهر هنا.')
            else
              ...build.entries.map((entry) => ListTile(
                    leading: const Icon(Icons.check_circle, color: purple),
                    title: Text(entry.value.name),
                    subtitle: Text(money(entry.value.priceIQD)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () =>
                          setState(() => build.remove(entry.key)),
                    ),
                  )),
            const Divider(height: 30),
            const Text('المجموع الكلي',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(money(total),
                style: const TextStyle(
                    fontSize: 28,
                    color: purple,
                    fontWeight: FontWeight.w900)),
            Text(dollars(total / usdRate),
                style: const TextStyle(color: Colors.white70)),
            const SizedBox(height: 24),
            const Text(
              'الأسعار والصور أمثلة أولية. يجب تأكيد سعر كل موديل وصورته من صفحة المتجر قبل اعتمادها. سعر الدولار قابل للتعديل من usdRate.',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

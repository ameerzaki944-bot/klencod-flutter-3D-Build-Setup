
import 'package:flutter/material.dart';

const Color purple = Color(0xFF9B8CFF);
const Color background = Color(0xFF090C16);
const Color panel = Color(0xFF171D30);
const int usdRate = 1500;

void main() {
  runApp(const BuildSetupApp());
}

class Product {
  final String category;
  final String name;
  final String brand;
  final int priceIQD;
  final String details;
  final String socket;
  final String ramType;
  final int watts;
  final String formFactor;

  const Product({
    required this.category,
    required this.name,
    required this.brand,
    required this.priceIQD,
    required this.details,
    this.socket = '',
    this.ramType = '',
    this.watts = 0,
    this.formFactor = '',
  });

  int get priceUSD => (priceIQD / usdRate).round();

  IconData get icon {
    switch (category) {
      case 'CPU':
        return Icons.memory;
      case 'GPU':
        return Icons.videogame_asset;
      case 'Motherboard':
        return Icons.developer_board;
      case 'RAM':
        return Icons.storage;
      case 'Storage':
        return Icons.save;
      case 'PSU':
        return Icons.electrical_services;
      case 'Case':
        return Icons.computer;
      case 'Cooling':
      case 'Fans':
        return Icons.mode_fan_off;
      case 'Monitor':
        return Icons.monitor;
      case 'Keyboard':
        return Icons.keyboard;
      case 'Mouse':
        return Icons.mouse;
      case 'Headset':
        return Icons.headphones;
      default:
        return Icons.devices;
    }
  }
}

class Catalog {
  static final List<Product> products = _createProducts();

  static List<Product> _createProducts() {
    final List<Product> list = [];

    void add(
      String category,
      String name,
      String brand,
      int price, {
      String details = '',
      String socket = '',
      String ramType = '',
      int watts = 0,
      String form = '',
    }) {
      list.add(Product(
        category: category,
        name: name,
        brand: brand,
        priceIQD: price,
        details: details,
        socket: socket,
        ramType: ramType,
        watts: watts,
        formFactor: form,
      ));
    }

    // Processors
    final cpus = [
      ['Intel Core i3-10100F', 'Intel', 'LGA1200', '65000'],
      ['Intel Core i3-12100F', 'Intel', 'LGA1700', '95000'],
      ['Intel Core i3-13100F', 'Intel', 'LGA1700', '115000'],
      ['Intel Core i5-10400F', 'Intel', 'LGA1200', '85000'],
      ['Intel Core i5-11400F', 'Intel', 'LGA1200', '100000'],
      ['Intel Core i5-12400F', 'Intel', 'LGA1700', '145000'],
      ['Intel Core i5-13400F', 'Intel', 'LGA1700', '210000'],
      ['Intel Core i5-14400F', 'Intel', 'LGA1700', '230000'],
      ['Intel Core i5-12600KF', 'Intel', 'LGA1700', '200000'],
      ['Intel Core i7-10700F', 'Intel', 'LGA1200', '160000'],
      ['Intel Core i7-12700F', 'Intel', 'LGA1700', '240000'],
      ['Intel Core i7-13700F', 'Intel', 'LGA1700', '320000'],
      ['Intel Core i7-14700F', 'Intel', 'LGA1700', '360000'],
      ['Intel Core i9-12900K', 'Intel', 'LGA1700', '350000'],
      ['Intel Core i9-13900K', 'Intel', 'LGA1700', '480000'],
      ['Intel Core i9-14900K', 'Intel', 'LGA1700', '550000'],
      ['AMD Ryzen 5 3600', 'AMD', 'AM4', '85000'],
      ['AMD Ryzen 5 5500', 'AMD', 'AM4', '90000'],
      ['AMD Ryzen 5 5600', 'AMD', 'AM4', '125000'],
      ['AMD Ryzen 5 5600X', 'AMD', 'AM4', '145000'],
      ['AMD Ryzen 7 5700X', 'AMD', 'AM4', '180000'],
      ['AMD Ryzen 7 5800X3D', 'AMD', 'AM4', '300000'],
      ['AMD Ryzen 5 7500F', 'AMD', 'AM5', '175000'],
      ['AMD Ryzen 5 7600', 'AMD', 'AM5', '210000'],
      ['AMD Ryzen 7 7700', 'AMD', 'AM5', '280000'],
      ['AMD Ryzen 7 7800X3D', 'AMD', 'AM5', '390000'],
      ['AMD Ryzen 7 9700X', 'AMD', 'AM5', '350000'],
      ['AMD Ryzen 7 9800X3D', 'AMD', 'AM5', '500000'],
      ['AMD Ryzen 9 7900X', 'AMD', 'AM5', '400000'],
      ['AMD Ryzen 9 9950X', 'AMD', 'AM5', '600000'],
    ];

    for (final c in cpus) {
      add('CPU', c[0], c[1], int.parse(c[3]),
          socket: c[2], details: 'Socket ${c[2]}');
    }

    // Graphics cards
    final gpus = [
      ['GTX 1050 Ti 4GB', 'NVIDIA', 90000, 75],
      ['GTX 1650 4GB', 'NVIDIA', 120000, 75],
      ['GTX 1660 Super 6GB', 'NVIDIA', 180000, 125],
      ['RTX 2060 6GB', 'NVIDIA', 200000, 160],
      ['RTX 2060 Super 8GB', 'NVIDIA', 230000, 175],
      ['RTX 2070 Super 8GB', 'NVIDIA', 260000, 215],
      ['RTX 3060 12GB', 'NVIDIA', 300000, 170],
      ['RTX 3060 Ti 8GB', 'NVIDIA', 330000, 200],
      ['RTX 3070 8GB', 'NVIDIA', 370000, 220],
      ['RTX 3080 10GB', 'NVIDIA', 480000, 320],
      ['RTX 4060 8GB', 'NVIDIA', 350000, 115],
      ['RTX 4060 Ti 8GB', 'NVIDIA', 420000, 160],
      ['RTX 4070 12GB', 'NVIDIA', 600000, 200],
      ['RTX 4070 Super 12GB', 'NVIDIA', 680000, 220],
      ['RTX 4070 Ti Super 16GB', 'NVIDIA', 850000, 285],
      ['RTX 4080 Super 16GB', 'NVIDIA', 1200000, 320],
      ['RTX 4090 24GB', 'NVIDIA', 2000000, 450],
      ['RX 580 8GB', 'AMD', 100000, 185],
      ['RX 6600 8GB', 'AMD', 220000, 132],
      ['RX 6650 XT 8GB', 'AMD', 260000, 176],
      ['RX 6700 XT 12GB', 'AMD', 320000, 230],
      ['RX 6750 XT 12GB', 'AMD', 350000, 250],
      ['RX 7600 8GB', 'AMD', 300000, 165],
      ['RX 7700 XT 12GB', 'AMD', 450000, 245],
      ['RX 7800 XT 16GB', 'AMD', 520000, 263],
      ['RX 7900 GRE 16GB', 'AMD', 650000, 260],
      ['RX 7900 XTX 24GB', 'AMD', 950000, 355],
      ['Intel Arc A580 8GB', 'Intel', 230000, 185],
      ['Intel Arc A750 8GB', 'Intel', 280000, 225],
      ['Intel Arc B580 12GB', 'Intel', 350000, 190],
    ];

    for (final g in gpus) {
      add('GPU', g[0] as String, g[1] as String, g[2] as int,
          watts: g[3] as int, details: 'VRAM / PCIe GPU');
    }

    // Motherboards
    final boards = [
      ['H410M', 'Intel', 'LGA1200', 'DDR4', 65000, 'mATX'],
      ['B460M', 'Intel', 'LGA1200', 'DDR4', 85000, 'mATX'],
      ['B560M', 'Intel', 'LGA1200', 'DDR4', 100000, 'mATX'],
      ['Z590', 'Intel', 'LGA1200', 'DDR4', 160000, 'ATX'],
      ['H610M DDR4', 'Intel', 'LGA1700', 'DDR4', 80000, 'mATX'],
      ['H610M DDR5', 'Intel', 'LGA1700', 'DDR5', 100000, 'mATX'],
      ['B660M DDR4', 'Intel', 'LGA1700', 'DDR4', 120000, 'mATX'],
      ['B660M DDR5', 'Intel', 'LGA1700', 'DDR5', 140000, 'mATX'],
      ['B760M DDR4', 'Intel', 'LGA1700', 'DDR4', 135000, 'mATX'],
      ['B760M DDR5', 'Intel', 'LGA1700', 'DDR5', 160000, 'mATX'],
      ['Z690 DDR4', 'Intel', 'LGA1700', 'DDR4', 200000, 'ATX'],
      ['Z690 DDR5', 'Intel', 'LGA1700', 'DDR5', 230000, 'ATX'],
      ['Z790 DDR5', 'Intel', 'LGA1700', 'DDR5', 300000, 'ATX'],
      ['A320M', 'AMD', 'AM4', 'DDR4', 60000, 'mATX'],
      ['B450M', 'AMD', 'AM4', 'DDR4', 75000, 'mATX'],
      ['B550M', 'AMD', 'AM4', 'DDR4', 110000, 'mATX'],
      ['X570', 'AMD', 'AM4', 'DDR4', 190000, 'ATX'],
      ['A620M DDR5', 'AMD', 'AM5', 'DDR5', 120000, 'mATX'],
      ['B650M DDR5', 'AMD', 'AM5', 'DDR5', 160000, 'mATX'],
      ['B650 ATX DDR5', 'AMD', 'AM5', 'DDR5', 200000, 'ATX'],
      ['B650E DDR5', 'AMD', 'AM5', 'DDR5', 250000, 'ATX'],
      ['X670E DDR5', 'AMD', 'AM5', 'DDR5', 330000, 'ATX'],
      ['X870 DDR5', 'AMD', 'AM5', 'DDR5', 350000, 'ATX'],
      ['X870E DDR5', 'AMD', 'AM5', 'DDR5', 450000, 'ATX'],
    ];

    for (final b in boards) {
      add('Motherboard', '${b[1]} ${b[0]}', b[1] as String,
          b[4] as int,
          socket: b[2] as String,
          ramType: b[3] as String,
          form: b[5] as String,
          details: '${b[2]} / ${b[3]} / ${b[5]}');
    }

    // RAM: capacity, speed, brand combinations
    final ramBrands = ['Kingston Fury', 'Corsair Vengeance', 'G.Skill',
      'TeamGroup T-Force', 'Crucial', 'ADATA XPG'];
    final capacities = [8, 16, 32, 64];
    final ramTypes = ['DDR4', 'DDR5'];

    for (final brand in ramBrands) {
      for (final type in ramTypes) {
        for (final capacity in capacities) {
          final base = type == 'DDR4' ? 1800 : 2600;
          final price = capacity * base + (brand == 'G.Skill' ? 5000 : 0);
          add('RAM', '$brand $capacity GB $type', brand, price * 10,
              ramType: type,
              details: '$capacity GB $type • Kit / model varies');
        }
      }
    }

    // SSD and HDD options
    final storageBrands = [
      'Samsung 980', 'Samsung 990 PRO', 'WD Blue SN580',
      'WD Black SN850X', 'Kingston NV2', 'Crucial P3 Plus',
      'Lexar NM790', 'TeamGroup MP44', 'ADATA Legend', 'Kingston A400',
    ];
    final storageSizes = [256, 512, 1000, 2000, 4000];

    for (final brand in storageBrands) {
      for (final size in storageSizes) {
        final price = size <= 256
            ? 18000
            : size <= 512
                ? 30000
                : size <= 1000
                    ? 55000
                    : size <= 2000
                        ? 100000
                        : 200000;
        add('Storage', '$brand ${size >= 1000 ? '${size ~/ 1000} TB' : '$size GB'}',
            brand, price + (brand.contains('990') || brand.contains('SN850')
                ? 30000 : 0),
            details: 'SSD • Capacity ${size >= 1000 ? '${size ~/ 1000} TB' : '$size GB'}');
      }
    }

    final hddBrands = ['Seagate Barracuda', 'WD Blue', 'Toshiba P300'];
    for (final brand in hddBrands) {
      for (final size in [1000, 2000, 4000, 8000]) {
        add('Storage', '$brand ${size ~/ 1000} TB HDD', brand,
            size == 1000 ? 45000 : size == 2000 ? 65000 : size == 4000 ? 95000 : 160000,
            details: 'HDD • ${size ~/ 1000} TB');
      }
    }

    // Power supplies
    final psus = [
      ['Corsair CV450', 450, 55000],
      ['Corsair CX550', 550, 75000],
      ['Corsair CX650', 650, 90000],
      ['Corsair RM750e', 750, 140000],
      ['Corsair RM850e', 850, 175000],
      ['Cooler Master MWE 550', 550, 70000],
      ['Cooler Master MWE 650', 650, 85000],
      ['Cooler Master MWE 750', 750, 110000],
      ['DeepCool PK650D', 650, 80000],
      ['DeepCool PN750M', 750, 135000],
      ['be quiet! Pure Power 12 M 850W', 850, 180000],
      ['Seasonic Focus GX-750', 750, 160000],
      ['MSI MAG A650BN', 650, 80000],
      ['MSI MAG A750GL', 750, 130000],
      ['Thermaltake Toughpower 850W', 850, 165000],
    ];

    for (final p in psus) {
      add('PSU', p[0] as String, (p[0] as String).split(' ').first,
          p[2] as int,
          watts: p[1] as int, details: '${p[1]}W • Verify connectors');
    }

    // Cases
    final cases = [
      ['Corsair 4000D Airflow', 120000, 'ATX'],
      ['NZXT H5 Flow', 130000, 'ATX'],
      ['Lian Li Lancool 216', 150000, 'ATX'],
      ['DeepCool CC560', 80000, 'ATX'],
      ['DeepCool CH370', 85000, 'mATX'],
      ['Montech Air 100', 80000, 'mATX'],
      ['Montech Air 903', 110000, 'ATX'],
      ['Cooler Master TD300 Mesh', 90000, 'mATX'],
      ['Fractal Pop Air', 140000, 'ATX'],
      ['Thermaltake Versa H18', 65000, 'mATX'],
      ['DarkFlash DK431', 85000, 'ATX'],
      ['Lian Li O11 Dynamic', 170000, 'ATX'],
      ['Budget White Gaming Case', 50000, 'mATX'],
      ['Budget Black Gaming Case', 45000, 'mATX'],
    ];

    for (final c in cases) {
      add('Case', c[0] as String, c[0].toString().split(' ').first,
          c[1] as int, form: c[2] as String,
          details: '${c[2]} case • Check GPU clearance');
    }

    // CPU cooling
    final coolers = [
      ['AMD Stock Cooler', 15000],
      ['Intel Stock Cooler', 12000],
      ['DeepCool AG400', 35000],
      ['DeepCool AK400', 45000],
      ['DeepCool AK620', 85000],
      ['Thermalright Peerless Assassin 120', 65000],
      ['Thermalright Phantom Spirit 120', 75000],
      ['Cooler Master Hyper 212', 45000],
      ['Noctua NH-U12S', 95000],
      ['Noctua NH-D15', 140000],
      ['Arctic Liquid Freezer III 240', 150000],
      ['DeepCool LS520 240mm', 135000],
      ['Corsair H100 RGB 240mm', 160000],
      ['Lian Li Galahad 360mm', 220000],
    ];

    for (final c in coolers) {
      add('Cooling', c[0] as String, c[0].toString().split(' ').first,
          c[1] as int, details: 'CPU cooler • Verify socket support');
    }

    // Case fans
    final fanBrands = ['Arctic P12', 'DeepCool FC120', 'Corsair AF120',
      'Cooler Master SickleFlow', 'Thermalright TL-C12'];
    for (final brand in fanBrands) {
      for (final count in [1, 3, 5]) {
        add('Fans', '$brand $count-pack', brand,
            count == 1 ? 12000 : count == 3 ? 30000 : 48000,
            details: '$count fans • Check fan headers');
      }
    }

    // Monitors
    final monitors = [
      ['AOC 24G2SP 24-inch 165Hz', 180000],
      ['MSI G244F 24-inch 170Hz', 190000],
      ['ASUS TUF VG249Q1A 165Hz', 200000],
      ['Samsung Odyssey G5 27-inch', 280000],
      ['LG UltraGear 27-inch 144Hz', 250000],
      ['Gigabyte G27Q 1440p', 300000],
      ['AOC 27-inch 180Hz', 240000],
      ['Budget 22-inch 75Hz', 85000],
      ['Budget 24-inch 100Hz', 110000],
      ['Dell 24-inch IPS', 130000],
      ['ASUS ProArt 27-inch', 400000],
      ['Samsung 32-inch 4K', 550000],
    ];
    for (final m in monitors) {
      add('Monitor', m[0] as String, m[0].toString().split(' ').first,
          m[1] as int, details: 'Monitor • Confirm resolution and refresh rate');
    }

    // Peripherals
    final keyboards = [
      ['Redragon K552', 45000], ['Redragon K617', 50000],
      ['Royal Kludge RK61', 65000], ['Logitech G213', 70000],
      ['Corsair K55', 85000], ['HyperX Alloy Origins', 130000],
      ['Budget RGB Keyboard', 20000], ['Mechanical Blue Switch', 30000],
    ];
    for (final p in keyboards) {
      add('Keyboard', p[0] as String, p[0].toString().split(' ').first,
          p[1] as int, details: 'Keyboard • Layout may vary');
    }

    final mice = [
      ['Logitech G102', 30000], ['Logitech G502 Hero', 65000],
      ['Razer DeathAdder Essential', 35000], ['Razer Viper Mini', 45000],
      ['Redragon M711', 30000], ['SteelSeries Rival 3', 45000],
      ['HyperX Pulsefire Haste', 65000], ['Budget Gaming Mouse', 12000],
    ];
    for (final p in mice) {
      add('Mouse', p[0] as String, p[0].toString().split(' ').first,
          p[1] as int, details: 'Mouse • DPI and connection vary');
    }

    final headsets = [
      ['HyperX Cloud II', 100000], ['Razer BlackShark V2 X', 75000],
      ['Logitech G435', 90000], ['Redragon H510', 50000],
      ['SteelSeries Arctis Nova 1', 85000], ['Budget Gaming Headset', 20000],
    ];
    for (final p in headsets) {
      add('Headset', p[0] as String, p[0].toString().split(' ').first,
          p[1] as int, details: 'Headset • Check connection type');
    }

    return list;
  }
}

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
        appBarTheme: const AppBarTheme(
          backgroundColor: background,
          centerTitle: true,
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
  final TextEditingController searchController = TextEditingController();
  final List<Product> selectedParts = [];

  String category = 'All';
  String search = '';

  final List<String> categories = const [
    'All', 'CPU', 'GPU', 'Motherboard', 'RAM', 'Storage',
    'PSU', 'Case', 'Cooling', 'Fans', 'Monitor',
    'Keyboard', 'Mouse', 'Headset'
  ];

  int get totalIQD =>
      selectedParts.fold(0, (sum, item) => sum + item.priceIQD);

  String get compatibility {
    final cpu = selectedParts.where((p) => p.category == 'CPU').firstOrNull;
    final board = selectedParts
        .where((p) => p.category == 'Motherboard').firstOrNull;
    final ram = selectedParts.where((p) => p.category == 'RAM').toList();
    final gpu = selectedParts.where((p) => p.category == 'GPU').firstOrNull;
    final psu = selectedParts.where((p) => p.category == 'PSU').firstOrNull;

    final issues = <String>[];

    if (cpu != null && board != null &&
        cpu.socket.isNotEmpty && board.socket.isNotEmpty &&
        cpu.socket != board.socket) {
      issues.add('المعالج والمذربورد غير متوافقين: ${cpu.socket} و${board.socket}.');
    }

    if (board != null && ram.isNotEmpty) {
      for (final r in ram) {
        if (board.ramType.isNotEmpty &&
            r.ramType.isNotEmpty &&
            board.ramType != r.ramType) {
          issues.add('نوع الرام ${r.ramType} لا يطابق المذربورد ${board.ramType}.');
          break;
        }
      }
    }

    if (gpu != null && psu != null && gpu.watts > 0 &&
        psu.watts > 0 && psu.watts < gpu.watts + 250) {
      issues.add('قدرة الباور سبلاي قد لا تكفي لهذه البطاقة مع بقية القطع.');
    }

    if (issues.isEmpty) {
      return 'ما ظهرت تعارضات أساسية بالقطع المختارة. هذا فحص أولي وليس ضمان توافق كامل.';
    }
    return issues.join('\n');
  }

  List<Product> get filteredProducts {
    return Catalog.products.where((p) {
      final matchesCategory = category == 'All' || p.category == category;
      final query = search.toLowerCase();
      final matchesSearch = p.name.toLowerCase().contains(query) ||
          p.brand.toLowerCase().contains(query) ||
          p.category.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectProduct(Product product) {
    setState(() {
      // القطع الرئيسية: اختيار قطعة واحدة من كل نوع.
      // التخزين والمراوح تسمح بإضافة أكثر من قطعة.
      if (product.category == 'Storage' || product.category == 'Fans') {
        selectedParts.add(product);
      } else {
        selectedParts.removeWhere((p) => p.category == product.category);
        selectedParts.add(product);
      }
    });
  }

  bool isSelected(Product product) {
    return selectedParts.contains(product);
  }

  String money(int value) {
    return '${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    )} د.ع';
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '3D Build Setup',
          style: TextStyle(color: purple, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'فحص التوافق',
            icon: const Icon(Icons.verified_outlined),
            onPressed: showCompatibility,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF292345), panel],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: purple.withOpacity(.35)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.computer, size: 42, color: purple),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ابنِ تجميعتك',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('${Catalog.products.length}+ خيار بالكتالوج',
                            style: const TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${selectedParts.length} قطع',
                          style: const TextStyle(color: purple)),
                      Text(money(totalIQD),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$${(totalIQD / usdRate).round()}',
                          style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: TextField(
              controller: searchController,
              onChanged: (value) => setState(() => search = value),
              decoration: InputDecoration(
                hintText: 'ابحث عن قطعة أو شركة...',
                prefixIcon: const Icon(Icons.search, color: purple),
                filled: true,
                fillColor: panel,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 46,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final item = categories[index];
                final active = item == category;
                return ChoiceChip(
                  label: Text(item),
                  selected: active,
                  selectedColor: purple,
                  onSelected: (_) => setState(() => category = item),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Row(
              children: [
                const Text('القطع المتوفرة',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('${products.length} نتيجة',
                    style: const TextStyle(color: Colors.white60)),
              ],
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? const Center(child: Text('ما لكيت قطعة بهذا الاسم'))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .76,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final selected = isSelected(product);
                      return InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () => showProduct(product),
                        child: Container(
                          decoration: BoxDecoration(
                            color: panel,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: selected ? purple : Colors.white10,
                              width: selected ? 2 : 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Icon(product.icon,
                                      size: 58, color: purple),
                                ),
                              ),
                              Text(product.category,
                                  style: const TextStyle(
                                      color: purple, fontSize: 12)),
                              const SizedBox(height: 4),
                              Text(product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              Text(money(product.priceIQD),
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.white70)),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: () => selectProduct(product),
                                  style: FilledButton.styleFrom(
                                    backgroundColor:
                                        selected ? Colors.green : purple,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8),
                                  ),
                                  child: Text(selected ? 'تم الاختيار' : 'اختيار'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FilledButton.icon(
            onPressed: showBuildSummary,
            icon: const Icon(Icons.build_circle_outlined),
            label: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('تجميعتي وفحص التوافق',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: purple,
              foregroundColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void showProduct(Product product) {
    showModalBottomSheet(
      context: context,
      backgroundColor: panel,
      showDragHandle: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Icon(product.icon, color: purple, size: 65)),
            const SizedBox(height: 12),
            Text(product.name,
                style: const TextStyle(
                    fontSize: 21, fontWeight: FontWeight.bold)),
            Text('${product.brand} • ${product.category}',
                style: const TextStyle(color: purple)),
            const SizedBox(height: 10),
            Text(product.details.isEmpty ? 'لا توجد تفاصيل إضافية' : product.details),
            const SizedBox(height: 10),
            Text(money(product.priceIQD),
                style: const TextStyle(fontSize: 18)),
            Text('تقريباً \$${product.priceUSD}',
                style: const TextStyle(color: Colors.white60)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  selectProduct(product);
                  Navigator.pop(context);
                },
                child: const Text('اختيار هذه القطعة'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCompatibility() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: panel,
        title: const Text('فحص التوافق'),
        content: Text(compatibility),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('تمام'),
          ),
        ],
      ),
    );
  }

  void showBuildSummary() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: panel,
      showDragHandle: true,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('تجميعتي',
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                if (selectedParts.isEmpty)
                  const Text('اختار قطع من الكتالوج حتى تظهر هنا.'),
                ...selectedParts.map((p) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(p.icon, color: purple),
                      title: Text(p.name),
                      subtitle: Text(p.category),
                      trailing: Text(money(p.priceIQD)),
                      ),
                    ),
                const Divider(),
                const Text('فحص التوافق',
                    style: TextStyle(
                        color: purple, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(compatibility),
                const SizedBox(height: 16),
                Text('المجموع: ${money(totalIQD)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text('تقريباً \$${(totalIQD / usdRate).round()}'),
                const SizedBox(height: 10),
                const Text(
                  'التقييم النهائي والأداء المتوقع يحتاجان معلومات إضافية عن القطع ودقتها الفعلية.',
                  style: TextStyle(color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

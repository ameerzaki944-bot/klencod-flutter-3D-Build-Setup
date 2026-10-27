
import 'package:flutter/material.dart';

void main() {
  runApp(const BuildSetupApp());
}

class BuildSetupApp extends StatelessWidget {
  const BuildSetupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3D Build Setup',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090D18),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6478FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String language = 'العربية';

  bool get isArabic => language == 'العربية';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF6478FF),
                            Color(0xFFAA65FF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.desktop_windows_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        '3D Build Setup',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    PopupMenuButton<String>(
                      initialValue: language,
                      tooltip: 'Language',
                      icon: const Icon(Icons.language),
                      onSelected: (value) {
                        setState(() {
                          language = value;
                        });
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'العربية',
                          child: Text('العربية'),
                        ),
                        PopupMenuItem(
                          value: 'English',
                          child: Text('English'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Text(
                  isArabic
                      ? 'صمّم تجميعتك'
                      : 'Build your dream PC',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isArabic
                      ? 'اختار القطع، اكتشف الأداء، وصمّم سيت أبك الخاص.'
                      : 'Choose parts, estimate performance, and design your setup.',
                  style: const TextStyle(
                    color: Color(0xFF9CA8C0),
                    fontSize: 15,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF202B50),
                        Color(0xFF15172D),
                        Color(0xFF101321),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: const Color(0xFF6478FF)
                          .withValues(alpha: 0.35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.view_in_ar_rounded,
                        size: 55,
                        color: Color(0xFF91A0FF),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        isArabic
                            ? 'تجميعة أحلامك تبدأ هنا'
                            : 'Your dream setup starts here',
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        isArabic
                            ? 'ابنِ جهازك حسب ميزانيتك واحتياجاتك.'
                            : 'Build a PC that matches your budget and needs.',
                        style: const TextStyle(
                          color: Color(0xFFB0BAD0),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: FilledButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BuilderPage(
                                  isArabic: isArabic,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          label: Text(
                            isArabic
                                ? 'ابدأ بناء التجميعة'
                                : 'Start Building',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Text(
                  isArabic ? 'مميزات التطبيق' : 'Features',
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                FeatureTile(
                  icon: Icons.memory_rounded,
                  title: isArabic ? 'اختيار القطع' : 'Choose Components',
                  subtitle: isArabic
                      ? 'معالج، كرت شاشة، رام والمزيد'
                      : 'CPU, GPU, RAM and more',
                ),
                FeatureTile(
                  icon: Icons.currency_exchange_rounded,
                  title: isArabic ? 'الأسعار والعملات' : 'Prices & Currencies',
                  subtitle: isArabic
                      ? 'خطط لميزانيتك بعملتك المفضلة'
                      : 'Plan your budget in your currency',
                ),
                FeatureTile(
                  icon: Icons.speed_rounded,
                  title: isArabic ? 'تقييم الأداء' : 'Performance',
                  subtitle: isArabic
                      ? 'تعرّف على قوة تجميعتك'
                      : 'Discover your PC performance',
                ),
                FeatureTile(
                  icon: Icons.view_in_ar_rounded,
                  title: isArabic ? 'تصميم ثلاثي الأبعاد' : '3D Design',
                  subtitle: isArabic
                      ? 'تصوّر شكل السيت أب الخاص بك'
                      : 'Visualize your setup',
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '3D Build Setup • v1.0',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131A2A),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF28334A),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF6478FF).withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF91A0FF),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA8C0),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuilderPage extends StatelessWidget {
  final bool isArabic;

  const BuilderPage({
    super.key,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final components = isArabic
        ? [
            ('CPU', 'المعالج', Icons.memory_rounded),
            ('GPU', 'كرت الشاشة', Icons.videogame_asset_rounded),
            ('RAM', 'الرام', Icons.developer_board_rounded),
            ('SSD', 'التخزين', Icons.storage_rounded),
            ('PSU', 'مزود الطاقة', Icons.bolt_rounded),
            ('Case', 'الكيس', Icons.computer_rounded),
          ]
        : [
            ('CPU', 'Processor', Icons.memory_rounded),
            ('GPU', 'Graphics Card', Icons.videogame_asset_rounded),
            ('RAM', 'Memory', Icons.developer_board_rounded),
            ('SSD', 'Storage', Icons.storage_rounded),
            ('PSU', 'Power Supply', Icons.bolt_rounded),
            ('Case', 'PC Case', Icons.computer_rounded),
          ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'بناء تجميعتك' : 'Build Your PC',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            isArabic
                ? 'اختار مكونات جهازك'
                : 'Choose your components',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isArabic
                ? 'هذه قائمة البداية. راح نضيف القطع والأسعار الحقيقية بالخطوة الجاية.'
                : 'This is the starting list. Real components and prices come next.',
            style: const TextStyle(
              color: Color(0xFF9CA8C0),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          for (final item in components)
            Card(
              color: const Color(0xFF131A2A),
              child: ListTile(
                leading: Icon(
                  item.$3,
                  color: const Color(0xFF91A0FF),
                  size: 29,
                ),
                title: Text(
                  item.$1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(item.$2),
                trailing: const Icon(
                  Icons.add_circle_outline,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isArabic
                            ? 'راح نضيف اختيار القطع الحقيقية بالخطوة الجاية!'
                            : 'Real component selection comes next!',
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

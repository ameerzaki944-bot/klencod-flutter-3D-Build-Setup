import 'package:flutter/material.dart';

void main() {
  runApp(const DeviceScanApp());
}

class DeviceScanApp extends StatelessWidget {
  const DeviceScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeviceScan',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF05070D),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C7DFF),
          brightness: Brightness.dark,
        ),
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
  int selectedTab = 0;
  bool scanning = false;

  void scanDevice() async {
    setState(() {
      scanning = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    setState(() {
      scanning = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Device scan completed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedTab,
          children: [
            HomeScreen(
              scanning: scanning,
              onScan: scanDevice,
            ),
            const GamesScreen(),
            const SecurityScreen(),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF090C14),
          border: Border(
            top: BorderSide(
              color: Color(0xFF1A2030),
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: const Color(0xFF090C14),
          indicatorColor: const Color(0xFF17274F),
          selectedIndex: selectedTab,
          onDestinationSelected: (index) {
            setState(() {
              selectedTab = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard_outlined),
              selectedIcon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.sports_esports_outlined),
              selectedIcon: Icon(Icons.sports_esports),
              label: 'Games',
            ),
            NavigationDestination(
              icon: Icon(Icons.shield_outlined),
              selectedIcon: Icon(Icons.shield),
              label: 'Security',
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// HOME
// ============================================================

class HomeScreen extends StatelessWidget {
  final bool scanning;
  final VoidCallback onScan;

  const HomeScreen({
    super.key,
    required this.scanning,
    required this.onScan,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // HEADER
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4C7DFF),
                      Color(0xFF7B5CFF),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x554C7DFF),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.phone_android,
                  color: Colors.white,
                  size: 26,
                ),
              ),

              const SizedBox(width: 13),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DeviceScan',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Smart device diagnostics',
                      style: TextStyle(
                        color: Color(0xFF7D879D),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF101521),
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(
                    color: const Color(0xFF1D2638),
                  ),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Color(0xFFB8C1D4),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // SEARCH
          Container(
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF0D111B),
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: const Color(0xFF1B2435),
              ),
            ),
            child: const TextField(
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search games, devices, modpacks...',
                hintStyle: TextStyle(
                  color: Color(0xFF59657A),
                ),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Color(0xFF71809A),
                ),
                suffixIcon: Icon(
                  Icons.tune_rounded,
                  color: Color(0xFF71809A),
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // DEVICE CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF121C36),
                  Color(0xFF0A101F),
                ],
              ),
              border: Border.all(
                color: const Color(0xFF26385F),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x301B4DB8),
                  blurRadius: 35,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: Column(
              children: [

                Row(
                  children: [
                    Container(
                      width: 82,
                      height: 110,
                      decoration: BoxDecoration(
                        color: const Color(0xFF080C15),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: const Color(0xFF263858),
                        ),
                      ),
                      child: const Icon(
                        Icons.smartphone_rounded,
                        size: 55,
                        color: Color(0xFF5B87FF),
                      ),
                    ),

                    const SizedBox(width: 18),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'YOUR DEVICE',
                            style: TextStyle(
                              color: Color(0xFF6F80A0),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),

                          SizedBox(height: 7),

                          Text(
                            'Detecting device...',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),

                          SizedBox(height: 8),

                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 9,
                                color: Color(0xFF36D98A),
                              ),
                              SizedBox(width: 7),
                              Text(
                                'Ready to scan',
                                style: TextStyle(
                                  color: Color(0xFF36D98A),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                SizedBox(
                  width: double.infinity,
                  height: 57,
                  child: ElevatedButton(
                    onPressed: scanning ? null : onScan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C7DFF),
                      disabledBackgroundColor: const Color(0xFF26334F),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: scanning
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 21,
                                height: 21,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Scanning device...',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.radar_rounded),
                              SizedBox(width: 10),
                              Text(
                                'SCAN DEVICE',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // SECTION TITLE
          const SectionTitle(
            title: 'Device Overview',
            subtitle: 'Your hardware at a glance',
          ),

          const SizedBox(height: 14),

          // STATS
          Row(
            children: const [
              Expanded(
                child: StatCard(
                  icon: Icons.memory_rounded,
                  title: 'RAM',
                  value: '--',
                  unit: 'GB',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.storage_rounded,
                  title: 'Storage',
                  value: '--',
                  unit: 'GB',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(
                child: StatCard(
                  icon: Icons.android_rounded,
                  title: 'Android',
                  value: '--',
                  unit: '',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: StatCard(
                  icon: Icons.memory_rounded,
                  title: 'CPU',
                  value: '--',
                  unit: '',
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // PERFORMANCE
          const SectionTitle(
            title: 'Performance',
            subtitle: 'Estimated gaming performance',
          ),

          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              color: const Color(0xFF0D111B),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: const Color(0xFF1B2435),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.speed_rounded,
                      color: Color(0xFF4C7DFF),
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Gaming Score',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '-- / 100',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const LinearProgressIndicator(
                    value: 0,
                    minHeight: 9,
                    backgroundColor: Color(0xFF1A2232),
                  ),
                ),

                const SizedBox(height: 14),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Performance',
                      style: TextStyle(
                        color: Color(0xFF66738A),
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      'Waiting for scan',
                      style: TextStyle(
                        color: Color(0xFF66738A),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // POPULAR GAMES
          const SectionTitle(
            title: 'Popular Games',
            subtitle: 'Check estimated FPS',
          ),

          const SizedBox(height: 14),

          const GameTile(
            icon: Icons.grass_rounded,
            name: 'Minecraft',
            category: 'Sandbox',
            fps: '-- FPS',
          ),

          const GameTile(
            icon: Icons.sports_esports_rounded,
            name: 'Roblox',
            category: 'Adventure',
            fps: '-- FPS',
          ),

          const GameTile(
            icon: Icons.local_fire_department_rounded,
            name: 'PUBG Mobile',
            category: 'Battle Royale',
            fps: '-- FPS',
          ),

          const GameTile(
            icon: Icons.flash_on_rounded,
            name: 'Call of Duty Mobile',
            category: 'Action',
            fps: '-- FPS',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// STAT CARD
// ============================================================

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;

  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFF0D111B),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF1B2435),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFF121E3A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF5B87FF),
              size: 20,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF758198),
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 5),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text(
                    unit,
                    style: const TextStyle(
                      color: Color(0xFF69758B),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// SECTION TITLE
// ============================================================

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF657187),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),

        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: Color(0xFF566176),
        ),
      ],
    );
  }
}

// ============================================================
// GAME TILE
// ============================================================

class GameTile extends StatelessWidget {
  final IconData icon;
  final String name;
  final String category;
  final String fps;

  const GameTile({
    super.key,
    required this.icon,
    required this.name,
    required this.category,
    required this.fps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 11),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0D111B),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF1B2435),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF17233E),
                  Color(0xFF101828),
                ],
              ),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF5B87FF),
              size: 27,
            ),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(
                    color: Color(0xFF69758A),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                fps,
                style: const TextStyle(
                  color: Color(0xFF4C7DFF),
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Estimated',
                style: TextStyle(
                  color: Color(0xFF5E6A7F),
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================
// GAMES SCREEN
// ============================================================

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Games',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ============================================================
// SECURITY SCREEN
// ============================================================

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Security',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
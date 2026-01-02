import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _cards = [
    {'title': 'Temel İşlemler', 'color': const Color(0xFFF0DEF8), 'progress': '12 / 100', 'icon': Icons.calculate, 'pillColor': Color(0xFF7E57C2)},
    {'title': 'Şekiller ve Geometri', 'color': const Color(0xFFD8F3F4), 'progress': '12 / 100', 'icon': Icons.crop_square, 'pillColor': Color(0xFF00A8CC)},
    {'title': 'Şekiller ve Geometri', 'color': const Color(0xFFDFF6E9), 'progress': '12 / 100', 'icon': Icons.category, 'pillColor': Color(0xFF00B894)},
    {'title': 'Temel İşlemler', 'color': const Color(0xFFFFF3CC), 'progress': '12 / 100', 'icon': Icons.calculate, 'pillColor': Color(0xFFEBB02D)},
    {'title': 'Temel İşlemler', 'color': const Color(0xFFFFE6D6), 'progress': '12 / 100', 'icon': Icons.calculate, 'pillColor': Color(0xFFFB8C00)},
    {'title': 'Şekiller ve Geometri', 'color': const Color(0xFFF9D8E8), 'progress': '12 / 100', 'icon': Icons.category, 'pillColor': Color(0xFFD6336C)},
  ];

  void _onNavTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = (width - 16 * 2 - 12) / 2;

    Widget homeContent = SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF3EC1B7),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3)),
                ],
              ),
              child: const Text('Ana Sayfa', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const SizedBox(height: 18),
            const Text('Merhaba Halil :)', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Asla pes etme", style: TextStyle(fontSize: 14, color: Colors.black54)),
            const SizedBox(height: 20),

            // Big purple card with illustration and Start button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF8E63FF), Color(0xFFD99BFF)]),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,6))],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('10 günlük seri', style: TextStyle(color: Colors.white70)),
                        const SizedBox(height: 6),
                        const Text('Günlük görev', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFD200),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                              ),
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Başla'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Illustration placeholder
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 120,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Icon(Icons.park, color: Colors.white70, size: 36)),
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Grid of category cards (2 columns)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _cards.map((c) {
                return Container(
                  width: cardWidth,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: c['color'],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(8), boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2)),
                        ]),
                        child: Icon(c['icon'], size: 22, color: Colors.blue.shade800),
                      ),
                      const SizedBox(height: 10),
                      Text(c['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: c['pillColor'], borderRadius: BorderRadius.circular(20), boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2)),
                        ]),
                        child: Text(c['progress'], style: const TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );

    final Widget bodyContent = _selectedIndex == 0 ? homeContent : const ProfilePage();

    return Scaffold(
      backgroundColor: const Color(0xFFF7EDE6),
      body: bodyContent,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF246BFD),
        unselectedItemColor: Colors.grey.shade500,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}


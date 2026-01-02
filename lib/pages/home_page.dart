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
    {'title': 'Türkçe', 'color': const Color(0xFFF9D8E8), 'icon': Icons.menu_book, 'pillColor': Color(0xFFE06BAF)},
    {'title': 'Matematik', 'color': const Color(0xFFF0DEF8), 'icon': Icons.calculate, 'pillColor': Color(0xFF7E57C2)},
    {'title': 'Tarih', 'color': const Color(0xFFFFF3CC), 'icon': Icons.history_edu, 'pillColor': Color(0xFFEBB02D)},
    {'title': 'Coğrafya', 'color': const Color(0xFFD8F3F4), 'icon': Icons.public, 'pillColor': Color(0xFF00A8CC)},
    {'title': 'Vatandaşlık', 'color': const Color(0xFFDFF6E9), 'icon': Icons.how_to_reg, 'pillColor': Color(0xFF00B894)},
    {'title': 'English', 'color': const Color(0xFFE8F6FF), 'icon': Icons.language, 'pillColor': Color(0xFF5DA9FF)},
  ];

  void _onNavTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget homeContent = SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox.shrink(),
            const SizedBox(height: 18),
            const Text('Merhaba Halil :)', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
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
                        const SizedBox(height: 6),
                        const Text('Günlük görev', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 14),
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

            // Category cards stacked in single column
            Column(
              children: _cards.map((c) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: c['color'],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10), boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0,2)),
                          ]),
                          child: Icon(c['icon'], size: 36, color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Center(
                            child: Text(c['title'], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ),
                      ],
                    ),
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


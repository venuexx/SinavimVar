import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'profile_page.dart';
import 'dersler/turkce_page.dart';
import 'dersler/matematik_page.dart';
import 'dersler/tarih_page.dart';
import 'dersler/cografya_page.dart';
import 'dersler/vatandaslik_page.dart';
import 'dersler/english_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _quotes = [
    'Bugün çalış, yarın rahat et.',
    'Az da olsa her gün ilerle.',
    'Disiplin, motivasyondan üstündür.',
    'Vazgeçmediğin sürece kazanırsın.',
    'Şu an zor, ama geçecek.',
    'Bir soru, bir adım ileri.',
    'Erteleme, başla.',
    'Emek asla boşa gitmez.',
    'Hedefini hatırla.',
    'Bugünkü sen, yarınki seni kurtarır.',
    'Küçük adımlar büyük sonuçlar doğurur.',
    'Çalışmak özgüven kazandırır.',
    'Bahane değil, çözüm üret.',
    'Kendinle yarış.',
    'Bugün pes etme günü değil.',
    'Zorlanıyorsan doğru yoldasın.',
    'Başarı tekrar ister.',
    'Şimdi çalış, sonra gurur duy.',
    'Konfor alanı başarı getirmez.',
    'İnan, odaklan, devam et.'
  ];
  late String _currentQuote;
  Timer? _quoteTimer;
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

  void _openCard(String title) {
    Widget? page;
    switch (title) {
      case 'Türkçe':
        page = const TurkcePage();
        break;
      case 'Matematik':
        page = const MatematikPage();
        break;
      case 'Tarih':
        page = const TarihPage();
        break;
      case 'Coğrafya':
        page = const CografyaPage();
        break;
      case 'Vatandaşlık':
        page = const VatandaslikPage();
        break;
      case 'English':
        page = const EnglishPage();
        break;
      default:
        page = null;
    }

    if (page != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
    }
  }

  @override
  void initState() {
    super.initState();
    _currentQuote = _quotes[Random().nextInt(_quotes.length)];
    _quoteTimer = Timer.periodic(const Duration(seconds: 5), (_) => _nextQuote());
  }

  void _nextQuote() {
    setState(() {
      _currentQuote = _quotes[Random().nextInt(_quotes.length)];
    });
  }

  @override
  void dispose() {
    _quoteTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Widget homeContent = SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),

            // Big purple card with greeting and rotating quote
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF8E63FF), Color(0xFFD99BFF)]),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0,6))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 6),
                    const Text(
                      'Merhaba Halil :)',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        _currentQuote,
                        key: ValueKey<String>(_currentQuote),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70, fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ),
                    const SizedBox(height: 6),
                  ],
                ),
            ),

            const SizedBox(height: 18),

            // Category cards stacked in single column (tappable)
            Column(
              children: _cards.map((c) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => _openCard(c['title']),
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


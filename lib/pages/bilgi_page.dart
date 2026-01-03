import 'package:flutter/material.dart';
import 'dersler/turkce_page.dart';
import 'dersler/matematik_page.dart';
import 'dersler/tarih_page.dart';
import 'dersler/vatandaslik_page.dart';
import 'dersler/cografya_page.dart';

class BilgiPage extends StatelessWidget {
  const BilgiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {'title': 'Türkçe', 'color': const Color(0xFFF9D8E8), 'icon': Icons.menu_book},
      {'title': 'Matematik', 'color': const Color(0xFFF0DEF8), 'icon': Icons.calculate},
      {'title': 'Tarih', 'color': const Color(0xFFFFF3CC), 'icon': Icons.history_edu},
      {'title': 'Coğrafya', 'color': const Color(0xFFD8F3F4), 'icon': Icons.public},
      {'title': 'Vatandaşlık', 'color': const Color(0xFFDFF6E9), 'icon': Icons.how_to_reg},
    ];

    void _openSubject(String title) {
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
        default:
          page = null;
      }

      if (page != null) Navigator.of(context).push(MaterialPageRoute(builder: (_) => page!));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Bilgi Kartları')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: subjects.map((s) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => _openSubject(s['title']),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: s['color'],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0,3))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.circular(10)),
                        child: Icon(s['icon'], size: 36, color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Center(
                          child: Text(s['title'], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

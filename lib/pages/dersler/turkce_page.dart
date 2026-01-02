import 'package:flutter/material.dart';

class TurkcePage extends StatelessWidget {
  const TurkcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Türkçe')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.menu_book, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('Türkçe', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Bu sayfa Türkçe dersine ait içerik içindir.'),
          ],
        ),
      ),
    );
  }
}

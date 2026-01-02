import 'package:flutter/material.dart';

class TarihPage extends StatelessWidget {
  const TarihPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarih')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.history_edu, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('Tarih', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Bu sayfa Tarih dersine ait içerik içindir.'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CografyaPage extends StatelessWidget {
  const CografyaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coğrafya')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.public, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('Coğrafya', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Bu sayfa Coğrafya dersine ait içerik içindir.'),
          ],
        ),
      ),
    );
  }
}

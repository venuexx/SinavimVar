import 'package:flutter/material.dart';

class MatematikPage extends StatelessWidget {
  const MatematikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matematik')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.calculate, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('Matematik', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Bu sayfa Matematik dersine ait içerik içindir.'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EnglishPage extends StatelessWidget {
  const EnglishPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('English')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.language, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('English', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('This page is for English subject content.'),
          ],
        ),
      ),
    );
  }
}

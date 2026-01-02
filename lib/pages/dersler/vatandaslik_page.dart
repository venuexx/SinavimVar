import 'package:flutter/material.dart';

class VatandaslikPage extends StatelessWidget {
  const VatandaslikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vatandaşlık')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.how_to_reg, size: 96, color: Colors.deepPurple),
            SizedBox(height: 16),
            Text('Vatandaşlık', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Bu sayfa Vatandaşlık dersine ait içerik içindir.'),
          ],
        ),
      ),
    );
  }
}

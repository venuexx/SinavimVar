import 'package:flutter/material.dart';

class HaritaOyunlariPage extends StatelessWidget {
  const HaritaOyunlariPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Harita Oyunları')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Harita oyunları buraya eklenecek. Örnek oyunlar: bayrak eşleştirme, şehir bulma, yön bulma.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MoneyConverterScreen extends StatelessWidget {
  static const String routeName = 'MoneyConverterScreen';
  const MoneyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
                hintText: 'Enter amount',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'From',
                hintText: 'Enter currency',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'To',
                hintText: 'Enter currency',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }
}

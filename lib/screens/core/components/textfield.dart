import 'package:flutter/material.dart';

class CustomTexField extends StatelessWidget {
  const CustomTexField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your username',
      ),
    );
  }
}

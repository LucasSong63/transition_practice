import 'package:flutter/material.dart';

class ConsumablePage extends StatelessWidget {
  final bool isTablet;
  const ConsumablePage({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumable Page')),
      body: Center(
        child: Text(
          isTablet ? 'Tablet View' : 'Mobile View',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

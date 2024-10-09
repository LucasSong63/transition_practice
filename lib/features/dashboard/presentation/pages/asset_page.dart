import 'package:flutter/material.dart';

class AssetPage extends StatelessWidget {
  final bool isTablet;

  const AssetPage({Key? key, required this.isTablet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asset Page')),
      body: Center(
        child: Text(
          isTablet ? 'Tablet View' : 'Mobile View',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final bool isTablet;
  const ProfilePage({Key? key, required this.isTablet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: Text(
          isTablet ? 'Tablet View' : 'Mobile View',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

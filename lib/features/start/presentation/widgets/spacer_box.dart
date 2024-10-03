import 'package:flutter/material.dart';

class SpacerBox extends StatelessWidget {
  final double height;

  // Constructor to accept the height parameter
  SpacerBox(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

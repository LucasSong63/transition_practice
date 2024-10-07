import 'package:flutter/material.dart';

class SpacerBox extends StatelessWidget {
  final double height;

  // Constructor to accept the height parameter
  const SpacerBox(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

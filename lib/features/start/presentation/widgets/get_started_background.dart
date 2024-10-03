import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class get_started_background extends StatelessWidget {
  const get_started_background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
      ),
      child: ClipPath(
        clipper: WaveClipper(),
        child: Container(
          height: 50.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(136, 195, 236, 1.0),
                Color.fromRGBO(255, 255, 255, 1.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * (0.5)); // Start at middle-left

    // First wave curve
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (0.3 + 0.5),
      size.width * 0.5,
      size.height * (0.5 + 0.1),
    );

    // Second wave curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (0.7 - 0.5),
      size.width,
      size.height * (0.5 - 0.1),
    );

    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height);
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true; // Reclip the shape for continuous animation
  }
}

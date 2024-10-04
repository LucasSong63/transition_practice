import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GetStartedBackground extends StatelessWidget {
  const GetStartedBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return Stack(
          children: [
            // First layer
            Padding(
              padding: EdgeInsets.only(top: Device.height * 0.5),
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: Device.height * 0.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF0D5AFF), // Darker blue on the top-left
                        Color(0xFFFFFFFF), // White towards the bottom-right
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Second layer with transparency
            Padding(
              padding: EdgeInsets.only(top: Device.height * 0.5),
              child: ClipPath(
                clipper:
                    SecondWaveClipper(), // Different clipper for a second curve
                child: Container(
                  height: Device.height * 0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0x6C0D5AFF), // Transparent layer
                        Color(
                            0x37FFFFFF), // Fully transparent at the bottom-right
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start higher on the left side
    path.moveTo(0, size.height * 0.5); // Left side is higher (20% of height)

    // First wave - sharp drop
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.1, // Midpoint (sharp drop)
      size.width * 0.5, size.height * 0.5, // Lower point (right is lower)
    );

    // Second wave - gentler slope to the right
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.8, // Smoother slope
      size.width, size.height * 0.2, // Ends lower on the right side
    );

    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(
        0, size.height * 0.4); // Slightly different start for second layer

    // First wave curve
    path.quadraticBezierTo(
      size.width * 0.30,
      size.height * 0.05,
      size.width * 0.6,
      size.height * 0.55,
    );

    // Second wave curve
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.1,
    );

    path.lineTo(size.width, size.height); // Bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      upperBound: 1,
      lowerBound: -1,
    )..repeat(reverse: true); // Repeat the animation back and forth
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.5,
                    ),
                    child: ClipPath(
                      clipper: AnimatedWaveClipper(_controller.value),
                      child: Container(
                        height: size.height * 0.5,
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
                  ),
                  const get_started_body()
                ],
              );
            }));
  }
}

class AnimatedWaveClipper extends CustomClipper<Path> {
  final double animationValue;

  AnimatedWaveClipper(this.animationValue);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * (0.5)); // Start at middle-left

    // First wave curve (adjust the y-values for the animation)
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (0.3 + 0.2 * animationValue), // Move based on animation
      size.width * 0.5,
      size.height * (0.5 + 0.1 * animationValue), // Move based on animation
    );

    // Second wave curve (adjust the y-values for the animation)
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (0.7 - 0.2 * animationValue), // Move based on animation
      size.width,
      size.height * (0.5 - 0.1 * animationValue), // Move based on animation
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

class get_started_body extends StatefulWidget {
  const get_started_body({
    super.key,
  });

  @override
  State<get_started_body> createState() => _get_started_bodyState();
}

class _get_started_bodyState extends State<get_started_body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double boxWidth = constraints.maxWidth * 0.8;
          double boxHeight = constraints.maxHeight * 0.9;
          boxWidth = boxWidth.clamp(100.0, 1000.0);
          boxHeight = boxHeight.clamp(400, 700);

          return SizedBox(
            width: boxWidth,
            height: boxHeight,
            child: Column(
              children: [
                SizedBox(
                  width: boxWidth,
                  height: boxHeight * 0.2,
                  child: Image.asset('assets/images/logo1.png'),
                ),
                const SizedBox(height: 40), //spacer
                Container(
                  width: boxWidth,
                  padding: const EdgeInsets.only(right: 65),
                  child: const AutoSizeText(
                    'Manage your assets in a single system',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    minFontSize: 20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: boxWidth,
                  child: const AutoSizeText(
                    'Empower your business with the power of precision asset tracking today. Join the future of asset management with Zenzaiko!',
                    style: TextStyle(fontSize: 30),
                    minFontSize: 15,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: boxHeight * 0.13),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceOut,
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 0, 28, 136),
                          Colors.blue
                        ])),
                    child: ElevatedButton(
                        onPressed: () {
                          print('pressed');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: const AutoSizeText(
                          'Let\'s Get Started',
                          minFontSize: 20,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

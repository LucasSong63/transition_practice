import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;

  CustomButton({
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Gradient _gradient = LinearGradient(
    colors: [
      Color.fromRGBO(18, 54, 98, 1.0),
      Color.fromRGBO(60, 125, 236, 1.0)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _gradient = LinearGradient(
        colors: [
          Color.fromRGBO(32, 59, 113, 1.0),
          Color.fromRGBO(6, 194, 107, 1.0),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      );
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _gradient = LinearGradient(
        colors: [
          Color.fromRGBO(18, 54, 98, 1.0),
          Color.fromRGBO(60, 125, 236, 1.0)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    });
  }

  void _onTapCancel() {
    setState(() {
      _gradient = LinearGradient(
        colors: [
          Color.fromRGBO(18, 54, 98, 1.0),
          Color.fromRGBO(60, 125, 236, 1.0)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: _gradient,
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

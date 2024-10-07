import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback onTap;
  final bool enabled;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    this.enabled = true, // Default is enabled
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Gradient _gradient = const LinearGradient(
    colors: [
      Color.fromRGBO(18, 54, 98, 1.0),
      Color.fromRGBO(60, 125, 236, 1.0)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  Gradient _disabledGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(18, 54, 98, 0.5019607843137255),
      Color.fromRGBO(60, 125, 236, 0.5019607843137255)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  void _onTapDown(TapDownDetails details) {
    if (widget.enabled) {
      setState(() {
        _gradient = const LinearGradient(
          colors: [
            Color.fromRGBO(32, 59, 113, 1.0),
            Color.fromRGBO(6, 194, 107, 1.0),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        );
      });
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.enabled) {
      setState(() {
        _gradient = const LinearGradient(
          colors: [
            Color.fromRGBO(18, 54, 98, 1.0),
            Color.fromRGBO(60, 125, 236, 1.0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      });
    }
  }

  void _onTapCancel() {
    if (widget.enabled) {
      setState(() {
        _gradient = const LinearGradient(
          colors: [
            Color.fromRGBO(18, 54, 98, 1.0),
            Color.fromRGBO(60, 125, 236, 1.0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.enabled ? _onTapDown : null,
      onTapUp: widget.enabled ? _onTapUp : null,
      onTapCancel: widget.enabled ? _onTapCancel : null,
      onTap: widget.enabled ? widget.onTap : null,
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: widget.enabled ? _gradient : _disabledGradient,
        ),
        duration: const Duration(milliseconds: 300),
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

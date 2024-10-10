import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeUtils {
  static double? _pixelDensity;
  static double? _boxWidth;
  static double? _boxHeight;
  static double? _clampedButtonHeight;

  static void initializeMobile(BuildContext context) {
    if (_pixelDensity == null) {
      _pixelDensity = MediaQuery.of(context).devicePixelRatio;
      _boxWidth = 90.w.clamp(50.0 * _pixelDensity!, 800.0 * _pixelDensity!);
      _boxHeight = 90.h.clamp(100 * _pixelDensity!, 700 * _pixelDensity!);
      _clampedButtonHeight =
          (_boxHeight! * 0.125).clamp(15 * _pixelDensity!, 22 * _pixelDensity!);
    }
  }

  static double getStaticPixelDensity() => _pixelDensity ?? 1.0;
  static double getStaticBoxWidth() => _boxWidth ?? 90.w;
  static double getStaticBoxHeight() => _boxHeight ?? 90.h;
  static double getStaticClampedButtonHeight() => _clampedButtonHeight ?? 22.0;

  static double getPixelDensity(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static double getBoxWidth(BuildContext context) {
    double pixelDensity = getPixelDensity(context);
    return 80.w.clamp(50.0 * pixelDensity, 800.0 * pixelDensity);
  }

  static double getBoxHeight(BuildContext context) {
    double pixelDensity = getPixelDensity(context);
    return 90.h.clamp(100 * pixelDensity, 700 * pixelDensity);
  }

  static double getClampedButtonHeight(BuildContext context) {
    double boxHeight = getBoxHeight(context);
    double pixelDensity = getPixelDensity(context);
    return (boxHeight * 0.125).clamp(15 * pixelDensity, 22 * pixelDensity);
  }
}

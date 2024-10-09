import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SizeUtils {
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

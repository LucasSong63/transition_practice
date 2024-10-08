import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AssetLifecycle {
  static void showAssetLifecycleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 50.h, // Adjust height as needed
          color: Colors.white,
          child: Center(
            child: Text(
              'Asset Lifecycle Bottom Sheet',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

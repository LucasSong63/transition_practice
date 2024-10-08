import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/utility/custom_button.dart';
import 'package:transition_practice/utility/spacer_box.dart';

class FailedDialog extends StatelessWidget {
  final double clampedButtonHeight;
  final String DialogText;

  const FailedDialog({
    super.key,
    required this.clampedButtonHeight,
    this.DialogText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 40.w,
                      child: Image(
                        image: AssetImage('assets/images/failed.png'),
                      ),
                    ),
                    SpacerBox(30),
                    Text(
                      'Please try again!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DialogText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Center(
                child: CustomButton(
                    width: double.infinity,
                    height: clampedButtonHeight,
                    text: 'Ok',
                    onTap: () {
                      Navigator.pop(context);
                    })),
          ],
        );
      },
    );
  }
}

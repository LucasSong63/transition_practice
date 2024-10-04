import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/start/presentation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/presentation/widgets/spacer_box.dart';

class SuccessDialog extends StatelessWidget {
  final double clampedButtonHeight;
  final String DialogText;
  final VoidCallback? onTap;

  const SuccessDialog({
    super.key,
    required this.clampedButtonHeight,
    this.DialogText = '',
    this.onTap,
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
                        image: AssetImage('assets/images/success.png'),
                      ),
                    ),
                    SpacerBox(30),
                    Text(
                      'Successful',
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
              onTap: onTap ?? () => Navigator.pop(context),
            )),
          ],
        );
      },
    );
  }
}

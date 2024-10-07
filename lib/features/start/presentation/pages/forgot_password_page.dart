import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/utility/custom_button.dart';
import 'package:transition_practice/utility/custom_textformfield.dart';
import 'package:transition_practice/utility/failed_dialog.dart';
import 'package:transition_practice/utility/spacer_box.dart';
import 'package:transition_practice/utility/success_dialog.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        final double pixelDensity = MediaQuery.of(context).devicePixelRatio;
        double boxWidth = 80.w.clamp(50.0 * pixelDensity, 800.0 * pixelDensity);
        double boxHeight = 90.h.clamp(100 * pixelDensity, 700 * pixelDensity);
        double clampedButtonHeight =
            (boxHeight * 0.125).clamp(15 * pixelDensity, 20 * pixelDensity);
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: boxWidth,
                  height: boxHeight,
                  child: Column(
                    children: [
                      SpacerBox(30),
                      Text(
                        'Enter Email Address',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.4),
                          wordSpacing: 0,
                          letterSpacing: 0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 80.w.clamp(100.0, 1000.0),
                        child: Text(
                          "A password reset link will be sent to your email to reset your password. If you don't get an email within a few minutes. Please try again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                      SpacerBox(30),
                      SizedBox(
                        width: 80.w,
                        child: CustomTextFormField(
                          labelText: 'Email Address',
                          hintText: 'example@gmail.com',
                          assetPath: 'assets/images/email.png',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            if (!value.contains('@') || !value.contains('.')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SpacerBox(15),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back to login',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SpacerBox(30),
                      CustomButton(
                          width: double.infinity,
                          height: clampedButtonHeight,
                          text: 'Send',
                          onTap: () {
                            _isValidationPass() ///////////Validation here
                                ? showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return SuccessDialog(
                                        onTap: () {
                                          context.pop();
                                          context.pop();
                                        },
                                        clampedButtonHeight:
                                            clampedButtonHeight,
                                        DialogText:
                                            'A password reset link has been sent to your email. Please check your email.',
                                      );
                                    },
                                  )
                                : showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return FailedDialog(
                                        clampedButtonHeight:
                                            clampedButtonHeight,
                                        DialogText:
                                            'An error occurred while sending the password reset link. Please try again.',
                                      );
                                    });
                          })
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  bool _isValidationPass() {
    return true;
  }
}

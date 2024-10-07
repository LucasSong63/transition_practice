import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/start/presentation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/presentation/widgets/spacer_box.dart';
import 'package:transition_practice/features/start/presentation/widgets/success_dialog.dart';

class SetNewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double pixelDensity = MediaQuery.of(context).devicePixelRatio;
    double boxWidth = 80.w.clamp(50.0 * pixelDensity, 800.0 * pixelDensity);
    double boxHeight = 90.h.clamp(100 * pixelDensity, 700 * pixelDensity);
    double clampedButtonHeight =
        (boxHeight * 0.125).clamp(15 * pixelDensity, 20 * pixelDensity);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Set New Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Sizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return SingleChildScrollView(
            child: Center(
              child: Container(
                width: boxWidth,
                height: boxHeight,
                child: Column(
                  children: [
                    SpacerBox(30),
                    Text(
                      'Enter New Password',
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
                        "Please enter your new password. It must be at least 6 characters long.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    SpacerBox(20),
                    Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 17,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextField(
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your new password',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SpacerBox(20),
                    Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 17,
                          wordSpacing: 0,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextField(
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your new password',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SpacerBox(50),
                    CustomButton(
                      width: boxWidth,
                      height: clampedButtonHeight,
                      text: 'Update Password',
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SuccessDialog(
                            clampedButtonHeight: clampedButtonHeight,
                            DialogText:
                                'Your password has been successfully reset. You can now login with your new password.',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

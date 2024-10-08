import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/utility/custom_button.dart';
import 'package:transition_practice/utility/custom_textformfield.dart';
import 'package:transition_practice/utility/failed_dialog.dart';
import 'package:transition_practice/utility/size_utils.dart';
import 'package:transition_practice/utility/spacer_box.dart';
import 'package:transition_practice/utility/success_dialog.dart';

class SetNewPasswordPage extends StatefulWidget {
  @override
  State<SetNewPasswordPage> createState() => _SetNewPasswordPageState();
}

class _SetNewPasswordPageState extends State<SetNewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  // Controller for password
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  // Controller for repeat password

  bool _buttonEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
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
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: SizeUtils.getBoxWidth(context),
                height: SizeUtils.getBoxHeight(context),
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
                    CustomTextFormField(
                      showSuffixIcon: true,
                      controller: _passwordController,
                      obscureText: true,
                      hintText: '******',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null; // Valid input
                      },
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
                    CustomTextFormField(
                      showSuffixIcon: true,
                      obscureText: true,
                      hintText: '******',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null; // Valid input
                      },
                      onChanged: (value) {
                        setState(() {
                          _buttonEnabled = value == _passwordController.text;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: SizeUtils.getBoxHeight(context) * 0.3,
                          top: SizeUtils.getBoxHeight(context) * 0.05),
                      child: CustomButton(
                        enabled: _buttonEnabled,
                        width: SizeUtils.getBoxWidth(context),
                        height: SizeUtils.getClampedButtonHeight(context),
                        text: 'Update Password',
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => _isSuccessfull()
                                ? SuccessDialog(
                                    clampedButtonHeight:
                                        SizeUtils.getClampedButtonHeight(
                                            context),
                                    DialogText:
                                        'Your password has been successfully reset. You can now login with your new password. \n\n Press Ok back to Login Page',
                                    onTap: () {
                                      context.go('/login');
                                    },
                                  )
                                : FailedDialog(
                                    clampedButtonHeight:
                                        SizeUtils.getClampedButtonHeight(
                                            context),
                                    DialogText:
                                        'Failed to reset password. Please try again.',
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

bool _isSuccessfull() {
  return true;
}

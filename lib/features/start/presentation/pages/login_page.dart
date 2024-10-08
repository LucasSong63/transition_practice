import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/utility/custom_button.dart';
import 'package:transition_practice/utility/custom_textformfield.dart';
import 'package:transition_practice/utility/failed_dialog.dart';
import 'package:transition_practice/utility/size_utils.dart';
import 'package:transition_practice/utility/spacer_box.dart';
import 'package:transition_practice/utility/success_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            // Wrap the whole body in SingleChildScrollView to allow scrolling
            child: Center(
              child: SizedBox(
                width: SizeUtils.getBoxWidth(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'start-login', // Same tag used in the previous page
                      child: SizedBox(
                        height: SizeUtils.getBoxHeight(context) * 0.2,
                        child: Image.asset('assets/images/logo1.png'),
                      ),
                    ),
                    SpacerBox(SizeUtils.getBoxHeight(context) * 0.05),

                    // Welcome Text
                    Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        'Welcome Back!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        minFontSize: 15,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SpacerBox(5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        'Log in to access your account',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        minFontSize: 13,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SpacerBox(SizeUtils.getBoxHeight(context) * 0.05),

                    // Username/Email TextField
                    CustomTextFormField(
                        icon: Icons.email_outlined,
                        labelText: 'Username/ Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }

                          return null; // Valid input
                        }),

                    const SpacerBox(30),

                    // Password TextField
                    const CustomTextFormField(
                      icon: Icons.lock_outline,
                      labelText: 'Password',
                      obscureText: true,
                    ),

                    const SpacerBox(15),

                    // Forgot Password Text
                    GestureDetector(
                      onTap: () {
                        context.push('/forgot-password');
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                    const SpacerBox(30),

                    // Login Button
                    CustomButton(
                      text: "Login",
                      onTap: () {
                        _isLoginSuccess()
                            ? showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return SuccessDialog(
                                    clampedButtonHeight:
                                        SizeUtils.getClampedButtonHeight(
                                            context),
                                    DialogText:
                                        'Login Successful\n\n Please ok to proceed to the Home Page',
                                    onTap: () {
                                      context.go('/home');
                                    },
                                  );
                                })
                            : showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return FailedDialog(
                                    clampedButtonHeight:
                                        SizeUtils.getClampedButtonHeight(
                                            context),
                                    DialogText:
                                        'Login Failed. Please try again.',
                                  );
                                });
                      },
                      width: double.infinity,
                      height: SizeUtils.getClampedButtonHeight(context),
                    ),
                    const SpacerBox(20),

                    // Not Registered Yet? Sign Up
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Not Registered yet?',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          TextSpan(
                            text: '  Sign Up',
                            style: const TextStyle(
                              color: Color.fromRGBO(60, 125, 236, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.push('/sign-up');
                              },
                          ),
                        ],
                      ),
                    ),
                    SpacerBox(SizeUtils.getBoxHeight(context) * 0.1),
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

// Validation function here --------------------------------------------------

bool _isLoginSuccess() {
  // Simulate login success
  return true;
}

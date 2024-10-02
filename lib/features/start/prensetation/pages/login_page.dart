import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transition_practice/features/start/prensetation/pages/sign_up_page.dart';
import 'package:transition_practice/features/start/prensetation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/prensetation/widgets/custom_textformfield.dart';
import 'package:transition_practice/features/start/prensetation/widgets/fade_transition_page.dart';
import 'package:transition_practice/features/start/prensetation/widgets/spacer_box.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double boxWidth = constraints.maxWidth * 0.8;
          double boxHeight = constraints.maxHeight * 0.9;
          boxWidth = boxWidth.clamp(100.0, 1000.0);
          boxHeight = boxHeight.clamp(400, 700);
          double clampedButtonHeight = (boxHeight * 0.125).clamp(50, 70);

          return SingleChildScrollView(
            // Wrap the whole body in SingleChildScrollView to allow scrolling
            child: Center(
              child: Container(
                width: boxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'start-login', // Same tag used in the previous page
                      child: SizedBox(
                        height: boxHeight * 0.2,
                        child: Image.asset('assets/images/logo1.png'),
                      ),
                    ),
                    SpacerBox(boxHeight * 0.05),

                    // Welcome Text
                    AutoSizeText(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      minFontSize: 15,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpacerBox(5),
                    AutoSizeText(
                      'Log in to access your account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      minFontSize: 13,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SpacerBox(boxHeight * 0.05),

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

                    SpacerBox(30),

                    // Password TextField
                    CustomTextFormField(
                      icon: Icons.lock_outline,
                      labelText: 'Password',
                      obscureText: true,
                    ),

                    SpacerBox(15),

                    // Forgot Password Text
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    SpacerBox(30),

                    // Login Button
                    CustomButton(
                      text: "Login",
                      onTap: () {},
                      width: double.infinity,
                      height: clampedButtonHeight,
                    ),
                    SpacerBox(20),

                    // Not Registered Yet? Sign Up
                    Container(
                      child: RichText(
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
                              style: TextStyle(
                                color: Color.fromRGBO(60, 125, 236, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .push(FadeTransitionPage(SignUpPage()));
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SpacerBox(boxHeight * 0.1),
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

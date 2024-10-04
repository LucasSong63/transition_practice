import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/start/presentation/pages/login_page.dart';
import 'package:transition_practice/features/start/presentation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/presentation/widgets/fade_transition_page.dart';
import 'package:transition_practice/features/start/presentation/widgets/failed_dialog.dart';
import 'package:transition_practice/features/start/presentation/widgets/spacer_box.dart';
import 'package:transition_practice/features/start/presentation/widgets/success_dialog.dart';

import '../widgets/custom_textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password
  final TextEditingController _repeatPasswordController =
      TextEditingController(); // Controller for repeat password
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, ScreenType) {
      final double pixelDensity = MediaQuery.of(context).devicePixelRatio;
      double boxWidth = 80.w.clamp(50.0 * pixelDensity, 800.0 * pixelDensity);
      double boxHeight = 90.h.clamp(100 * pixelDensity, 700 * pixelDensity);
      double clampedButtonHeight =
          (boxHeight * 0.125).clamp(15 * pixelDensity, 23 * pixelDensity);
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                width: boxWidth,
                child: Column(
                  children: [
                    Hero(
                      tag: 'start-login', // Same tag as in the previous page
                      child: SizedBox(
                        width: double.infinity,
                        height: boxHeight * 0.125,
                        child: Image.asset(
                          'assets/images/logo1.png',
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    const SpacerBox(15),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                            TextSpan(
                              text: '  Login Here',
                              style: const TextStyle(
                                color: Color.fromRGBO(60, 125, 236, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SpacerBox(20),
                    CustomTextFormField(
                      //////////Name TextFormField
                      assetPath: 'assets/images/person.png',
                      labelText: 'Name *',
                      showSuffixIcon: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required.';
                        }
                        if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
                          return 'Please enter a valid name.';
                        }
                        if (value.length < 2) {
                          return 'Name must be at least 2 characters long';
                        }
                        return null; // Valid input
                      },
                    ),
                    const SpacerBox(20),
                    CustomTextFormField(
                      //////////Surname TextFormField
                      assetPath: 'assets/images/family-tree.png',
                      labelText: 'Surname *',
                      showSuffixIcon: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Surname is required.';
                        }
                        if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value)) {
                          return 'Please enter a valid Surname.';
                        }
                        if (value.length < 2) {
                          return 'Name must be at least 2 characters long';
                        }
                        return null; // Valid input
                      },
                    ),
                    const SpacerBox(20),
                    CustomTextFormField(
                        //////////Email TextFormField
                        assetPath: 'assets/images/email.png',
                        labelText: 'Email Address *',
                        showSuffixIcon: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                              .hasMatch(value)) {
                            return 'Enter a valid email address';
                          }
                          return null; // Valid input
                        }),
                    const SpacerBox(20),
                    CustomTextFormField(
                        ////////// Username TextFormField
                        assetPath: 'assets/images/profile-avatar.png',
                        labelText: 'Username *',
                        showSuffixIcon: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
                            return 'Username can only contain letters and numbers, without spaces';
                          }

                          return null; // Valid input
                        }),
                    const SpacerBox(20),
                    CustomTextFormField(
                      ////////// Password TextFormField
                      assetPath: 'assets/images/open-lock.png',
                      labelText: 'Password',
                      showSuffixIcon: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null; // Valid input
                      },
                      obscureText: true,
                    ),
                    const SpacerBox(20),
                    CustomTextFormField(
                        ////////// Password Repeat TextFormField
                        assetPath:
                            'assets/images/restore-password.png', // Password Repeat icon
                        labelText: 'Password (repeat)',
                        controller: _repeatPasswordController,
                        obscureText: true,
                        showSuffixIcon: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null; // Valid input
                        }),
                    const SpacerBox(20),
                    CustomTextFormField(
                      ////////// Workplace TextFormField
                      assetPath:
                          'assets/images/workplace.png', // Workplace icon
                      labelText: 'Enter Your Workplace Name',
                      showSuffixIcon: true,
                      validator: (value) {
                        if (value != null && value.isNotEmpty) {
                          if (!RegExp(r"^[a-zA-Z0-9\s]+$").hasMatch(value)) {
                            return 'Workspace can only contain letters, numbers, and spaces';
                          }
                        }
                        return null; // Valid input
                      },
                    ),
                    const SpacerBox(20),
                    DropdownButtonFormField<String>(
                      items: ['Company', 'Personal']
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        // String? workplaceType = value;
                      },
                      decoration: InputDecoration(
                        labelText: '  Choose One: Company/Personal',
                        labelStyle: const TextStyle(fontSize: 13),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Image.asset(
                            'assets/images/dropdown-arrow.png', // If assetPath is provided, use Image.asset
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                    const SpacerBox(50),
                    CustomButton(
                        width: double.infinity,
                        height: clampedButtonHeight,
                        text: 'Register',
                        onTap: () {
                          _isValidationPass() /////Validation function here
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SuccessDialog(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              FadeTransitionPage(
                                                  const LoginPage()));
                                        },
                                        clampedButtonHeight:
                                            clampedButtonHeight,
                                        DialogText:
                                            'Your registration has been successful! Please wait for the email to confirm your registration.');
                                  })
                              : showDialog(
                                  context: context,
                                  builder: (context) {
                                    return FailedDialog(
                                        clampedButtonHeight:
                                            clampedButtonHeight,
                                        DialogText:
                                            'Username has been taken. Please try with a different username.');
                                  });
                        }),
                    const SpacerBox(50),
                  ],
                ),
              ),
            ),
          ));
    });
  }

  bool _isValidationPass() {
    return true;
  }
}

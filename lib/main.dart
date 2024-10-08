import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart'; // Import the Sizer package
import 'package:transition_practice/features/dashboard/presentation/pages/home_page.dart';
import 'package:transition_practice/features/start/presentation/pages/forgot_password_page.dart';
import 'package:transition_practice/features/start/presentation/pages/login_page.dart';
import 'package:transition_practice/features/start/presentation/pages/set_new_password_page.dart';
import 'package:transition_practice/features/start/presentation/pages/sign_up_page.dart';

import 'features/start/presentation/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Hero Animation Example',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, // Default AppBar color
              elevation: 0,
            ),
            primarySwatch: customSwatch,
            primaryColor: const Color.fromRGBO(18, 54, 98, 1.0),
            fontFamily: 'Poppins',
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: customSwatch), // Default border color
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: customSwatch), // Focused border color
              ),
            ),
          ),
        );
      },
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Map<int, Color> color = {
  50: const Color.fromRGBO(32, 59, 113, .1),
  100: const Color.fromRGBO(32, 59, 113, .2),
  200: const Color.fromRGBO(32, 59, 113, .3),
  300: const Color.fromRGBO(32, 59, 113, .4),
  400: const Color.fromRGBO(32, 59, 113, .5),
  500: const Color.fromRGBO(32, 59, 113, .6),
  600: const Color.fromRGBO(32, 59, 113, .7),
  700: const Color.fromRGBO(32, 59, 113, .8),
  800: const Color.fromRGBO(32, 59, 113, .9),
  900: const Color.fromRGBO(32, 59, 113, 1.0),
};

MaterialColor customSwatch = MaterialColor(0xFF203B71, color);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// GoRouter configuration
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => GetStartedPage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          pageBuilder: (context, state) =>
              _fadeTransitionPage(context, state, const LoginPage()),
        ),
        GoRoute(
          path: 'set-new-password',
          pageBuilder: (context, state) =>
              _fadeTransitionPage(context, state, SetNewPasswordPage()),
        ),
        GoRoute(
          path: 'sign-up',
          pageBuilder: (context, state) =>
              _fadeTransitionPage(context, state, SignUpPage()),
        ),
        GoRoute(
          path: 'forgot-password',
          pageBuilder: (context, state) =>
              _fadeTransitionPage(context, state, ForgotPasswordPage()),
        ),
        GoRoute(
          path: 'home',
          pageBuilder: (context, state) =>
              _fadeTransitionPage(context, state, HomePage()),
        )
      ],
    ),
  ],
);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  fade transition page
Page _fadeTransitionPage(
    BuildContext context, GoRouterState state, Widget page) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: page,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 400),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

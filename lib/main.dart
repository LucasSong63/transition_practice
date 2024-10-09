import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for orientation control
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart'; // Import the Sizer package
import 'package:transition_practice/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:transition_practice/features/start/presentation/pages/forgot_password_page.dart';
import 'package:transition_practice/features/start/presentation/pages/login_page.dart';
import 'package:transition_practice/features/start/presentation/pages/set_new_password_page.dart';
import 'package:transition_practice/features/start/presentation/pages/sign_up_page.dart';
import 'package:transition_practice/utility/size_utils.dart';

import 'features/start/presentation/pages/get_started_page.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure initialization before setting orientation
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeUtils.initializeMobile(context);
    return Sizer(
      builder: (context, orientation, screenType) {
        _setOrientation(context); // Set orientation based on screen size
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

  ////// Function to set orientation based on screen width////////////////////////////////////////////////
  void _setOrientation(BuildContext context) {
    // Define tablet width threshold (e.g., devices with width > 600px are considered tablets)
    bool isTablet = _isTablet(context);
    print(isTablet);
    print(SizeUtils.getBoxWidth(context));
    print(SizeUtils.getPixelDensity(context));

    if (isTablet) {
      // Allow both landscape and portrait for tablets
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      // Lock orientation to portrait for mobile
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp, // Only allow portrait mode for mobile
      ]);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////

bool _isTablet(BuildContext context) {
  bool isTablet =
      SizeUtils.getBoxWidth(context) > 280 * SizeUtils.getPixelDensity(context);
  return isTablet;
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
MaterialColor secondarySwatch = MaterialColor(0xd9fdfd, color);
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
          pageBuilder: (context, state) => _fadeTransitionPage(
              context, state, DashboardPage(isTablet: _isTablet(context))),
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

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import the Sizer package

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
        return MaterialApp(
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
          home: const GetStartedPage(),
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////////
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

////////////////////////////////////////////////////////

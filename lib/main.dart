import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Import the Sizer package

import 'features/start/presentation/pages/get_started_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
            primaryColor: Color.fromRGBO(18, 54, 98, 1.0),
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
          home: GetStartedPage(),
        );
      },
    );
  }
}

//////////////////////////////////////////////////////////////
Map<int, Color> color = {
  50: Color.fromRGBO(32, 59, 113, .1),
  100: Color.fromRGBO(32, 59, 113, .2),
  200: Color.fromRGBO(32, 59, 113, .3),
  300: Color.fromRGBO(32, 59, 113, .4),
  400: Color.fromRGBO(32, 59, 113, .5),
  500: Color.fromRGBO(32, 59, 113, .6),
  600: Color.fromRGBO(32, 59, 113, .7),
  700: Color.fromRGBO(32, 59, 113, .8),
  800: Color.fromRGBO(32, 59, 113, .9),
  900: Color.fromRGBO(32, 59, 113, 1.0),
};

MaterialColor customSwatch = MaterialColor(0xFF203B71, color);

////////////////////////////////////////////////////////

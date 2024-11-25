import 'package:flutter/material.dart';

class Themes {
  static final appThemeData = {
    AppThemes.light: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      fontFamily: 'Source Sans Pro',
      textTheme: const TextTheme(
        bodyText2: TextStyle(),
      ).apply(bodyColor: Colors.black, displayColor: Colors.white),
    ),
    AppThemes.dark: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF03233F),
      primarySwatch: Colors.teal,
      backgroundColor: Colors.blue[50],
      fontFamily: 'Source Sans Pro',
      textTheme: const TextTheme(
        bodyText2: TextStyle(),
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    )
  };
}

enum AppThemes { light, dark }

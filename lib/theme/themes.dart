import 'package:flutter/material.dart';
import 'package:soundconverge/theme/colors.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDark = false;

  ThemeMode get currTheme => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.black),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
        primaryColor: lightPrimaryColor,
        backgroundColor: lightBgColor,
        scaffoldBackgroundColor: lightBgColor,
        accentColor: lightAccent);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
        primaryColor: darkPrimaryColor,
        backgroundColor: darkBgColor,
        scaffoldBackgroundColor: darkBgColor,
        accentColor: darkAccent);
  }
}

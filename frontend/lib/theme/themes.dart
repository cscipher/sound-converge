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
          headline1: TextStyle(color: darkBgColor),
          headline2: TextStyle(color: darkBgColor),
          bodyText1: TextStyle(color: darkBgColor),
          bodyText2: TextStyle(color: darkBgColor),
        ),
        primaryColor: lightPrimaryColor,
        backgroundColor: lightBgColor,
        scaffoldBackgroundColor: lightBgColor,
        accentColor: lightAccent);
  }

  static ThemeData get darkTheme {
    return ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(color: lightBgColor),
          headline2: TextStyle(color: lightBgColor),
          bodyText1: TextStyle(color: lightBgColor),
          bodyText2: TextStyle(color: lightBgColor),
        ),
        primaryColor: darkPrimaryColor,
        backgroundColor: darkBgColor,
        scaffoldBackgroundColor: darkBgColor,
        accentColor: darkAccent);
  }
}

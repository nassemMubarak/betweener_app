import 'package:flutter/material.dart';

enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;
}

class AppThemeData {
  static final darkTheme = ThemeData();
  static final lightTheme = ThemeData(scaffoldBackgroundColor: Colors.white, primaryColor: const Color(0xFF2D2B4E), colorScheme: const ColorScheme.light(), iconTheme: const IconThemeData(color: Color(0xFF747474)), hintColor: const Color(0xFF747474), textTheme: const TextTheme(subtitle1: TextStyle(color: Color(0xff2D2B4E))));
}

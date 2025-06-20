import 'package:flutter/material.dart';

final Color kPrimaryColor = Color(0xFF0070FC);
final Color kDarkBgColor = Color(0xFF0A0A0A);

//Light Theme Colors
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'PlusJakartaSans',
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: kPrimaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    brightness: Brightness.light,
    surface: Colors.white,
    surfaceBright: Colors.grey[100]!,
    onSurface: Colors.black,
    onSurfaceVariant: Colors.grey[800]!,
    onSecondary: kPrimaryColor,
    secondary: Colors.black54,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  ),
);

//Dark Theme Colors
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'PlusJakartaSans',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: kDarkBgColor,
  primaryColor: kPrimaryColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    brightness: Brightness.dark,
    surface: Colors.black87,
    surfaceBright: Colors.grey[900]!,
    onSurface: Colors.white,
    onSurfaceVariant: Colors.grey[800]!,
    onSecondary: Colors.white,
    secondary: Colors.white54,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    ),
  ),
);

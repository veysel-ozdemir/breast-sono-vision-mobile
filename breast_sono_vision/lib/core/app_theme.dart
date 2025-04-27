import 'package:breast_sono_vision/core/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Font Family
  static String manropeFontFamily = GoogleFonts.manrope().fontFamily!;

  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: ColorPalette.primary,
    scaffoldBackgroundColor: ColorPalette.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primary,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.manropeTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: ColorPalette.secondary,
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        foregroundColor: const WidgetStatePropertyAll(ColorPalette.secondary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(color: ColorPalette.secondary, width: 3),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      filled: true,
      fillColor: Colors.grey.shade100,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorPalette.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primary,
      brightness: Brightness.dark,
    ),
  );
}

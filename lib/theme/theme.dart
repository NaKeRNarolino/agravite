import 'package:agravite/theme/dark_theme.dart';
import 'package:agravite/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const inter = "Inter Variable";

final theme = ThemeData(
    colorScheme: darkColorScheme,
    textTheme: TextTheme(
        headlineLarge:
            TextStyle(fontFamily: inter, fontWeight: FontWeight.w700),
        bodyMedium: TextStyle(fontFamily: inter)));

ThemeData getTheme(Brightness brightness) {
  return brightness == Brightness.dark
      ? theme.copyWith(colorScheme: darkColorScheme)
      : theme.copyWith(colorScheme: lightColorScheme);
}

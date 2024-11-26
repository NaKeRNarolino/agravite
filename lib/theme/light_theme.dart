import 'package:flutter/material.dart';

const textColor = Color(0xFF0b050c);
const backgroundColor = Color(0xFFfaf2fb);
const primaryColor = Color(0xFFc435db);
const primaryFgColor = Color(0xFF0b050c);
const secondaryColor = Color(0xFFe381f3);
const secondaryFgColor = Color(0xFF0b050c);
const accentColor = Color(0xFFdd00ff);
const accentFgColor = Color(0xFF0b050c);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // background: backgroundColor,
  // onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

import 'package:flutter/material.dart';

const textColor = Color(0xFFf6ecf6);
const backgroundColor = Color(0xFF0b050b);
const primaryColor = Color(0xFFe88ee8);
const primaryFgColor = Color(0xFF0b050b);
const secondaryColor = Color(0xFF981098);
const secondaryFgColor = Color(0xFFf6ecf6);
const accentColor = Color(0xFFfa08fa);
const accentFgColor = Color(0xFF0b050b);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
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
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),
);

import 'package:flutter/material.dart';

ThemeData kLightTheme = ThemeData.light();
ThemeData kDarkTheme = ThemeData.dark().copyWith(
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all(Colors.grey[800]),
    thumbColor: MaterialStateProperty.all(Colors.grey[600]),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
    ),
  ),
);

// File to determine color scheme for modes
import 'package:flutter/material.dart';
import 'package:hotel_management/source/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColorLight,
  cardColor: secondaryColorLight,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: primaryColorLight,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColorLight,
    textTheme: ButtonTextTheme.primary,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: primaryColorDark,
  cardColor: secondaryColorDark,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: primaryColorDark,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: primaryColorDark,
    textTheme: ButtonTextTheme.primary,
  ),
);

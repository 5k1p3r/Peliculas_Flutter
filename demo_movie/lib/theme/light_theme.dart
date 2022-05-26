import 'package:demo_movie/helpers/utilities.dart';
import 'package:flutter/material.dart';

ThemeData LightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: bGColor,
  backgroundColor: bGColor,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: kPrimaryColor,
          fontSize: 14.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: kSecondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kSecondaryColor),
      ),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kSecondaryColor, width: 2)),
      iconColor: kSecondaryColor,
      prefixIconColor: kSecondaryColor,
      labelStyle: TextStyle(color: Colors.grey)),
);

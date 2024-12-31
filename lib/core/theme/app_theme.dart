import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      secondary: Color(0xffF9F9F9),
      onSecondary: Color(0xffF7F7F7),
      onPrimary: Colors.black,
      outline: Colors.grey,
      onPrimaryFixed: Colors.black,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff22252E),
    colorScheme: ColorScheme.dark(
      primary: Color(0xff22252E),
      secondary: Color(0xff292D36),
      onSecondary: Color(0xff272B34),
      onPrimary: Colors.white,
      outline: Colors.white,
      onPrimaryFixed: Colors.grey,
    ),
  );
}

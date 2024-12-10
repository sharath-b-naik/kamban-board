import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Noto Serif',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
            primary: Color(0xFF0076EB),
            onPrimary: Colors.white,
            surface: Color(0xFFFAFCFF),
            onSurface: Color(0xDE04294E),
            secondary: Color(0xFFFFFFFF),
            onSecondary: Colors.black,
            brightness: Brightness.light,
            tertiary: Color(0xDE04294E),
            outline: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: const Color(0xDE04294E), fontSize: 16.sp),
          bodyMedium: const TextStyle(color: Color(0x9904294E)),
          bodySmall: const TextStyle(color: Color(0x6104294E)),
          titleMedium: const TextStyle(color: Color(0xDE04294E)),
        ),
      );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Noto Serif',
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        primary: Color(0xFF0076EB),
        surface: Color(0xFF121212),
        onSurface: Color(0xDEEDF6FF),
        secondary: Color(0xFF222222),
        onSecondary: Colors.white,
        onPrimary: Colors.white,
        tertiary: Color(0x61ECF5FE),
        outline: Colors.black),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: const Color(0xDEEDF6FF), fontSize: 16.sp),
      bodyMedium: const TextStyle(color: Color(0x99ECF5FE)),
      bodySmall: const TextStyle(color: Color(0x61ECF5FE)),
    ),
  );
}

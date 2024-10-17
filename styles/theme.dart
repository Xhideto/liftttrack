// theme.dart
import 'package:flutter/material.dart';
import 'styles.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.deepOrange[600],
    hintColor: Colors.deepOrange[600],
    textTheme: TextTheme(
      headlineMedium: AppStyles.titleStyle,
      bodyLarge: AppStyles.buttonStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
      filled: true,
      fillColor: Colors.grey[200],
    ),
  );
}
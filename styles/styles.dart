// styles.dart
import 'package:flutter/material.dart';

// styles.dart
class AppStyles {
  AppStyles._();

  static TextStyle get titleStyle => TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange[600]);
  static TextStyle get buttonStyle => const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static BoxDecoration get cardDecoration => BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.white,
  );
  static InputDecoration get inputDecoration => InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
    ),
    filled: true,
    fillColor: Colors.grey[200],
  );
}
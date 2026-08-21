import 'package:flutter/material.dart';

abstract class AppColors {
  // --- Primary Colors ---
  static const Color primary = Color(0xFFBFA054);
  static const Color primaryDark = Color(0xFF9E813B);
  static const Color primaryLight = Color(0xFFE5D5AA);

  // --- Dark Theme Specific Colors ---
  static const Color darkScaffoldBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkBorder = Color(0xFF2C2C2C);
  static const Color darkTextBody = Color(0xFFA6A6A6);
  static const Color darkError = Color(0xFFCF6679);

  // --- Light Theme Specific Colors ---
  static const Color lightScaffoldBackground = Color(0xFFF7F8F9);
  static const Color lightSurface = Color(0xFFF7F8F9);
  static const Color lightBorder = Color(0xFFE8ECF4);
  static const Color lightTextPrimary = Color(0xFF242424);
  static const Color lightTextSecondary = Color(0xFF8391A1);
  static const Color lightError = Color(0xFFE53935);

  // --- Common Colors ---
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}

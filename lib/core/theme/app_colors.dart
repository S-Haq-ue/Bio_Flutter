import 'package:flutter/material.dart';

class AppColors {
  // Background Colors
  static const Color backgroundDark = Color(0xFFF3F0EA); // Soft warm cream
  static const Color backgroundLight = Color(0xFFFDFBF7); // Off-white/brighter cream

  // Accent Colors
  static const Color primaryAccent = Color.fromARGB(255, 252, 184, 110); // Vibrant Orange
  static const Color secondaryAccent = Color.fromARGB(255, 86, 47, 0); // Deep Purple
  static const Color tertiaryAccent = Color(0xFFFF007F); // Neon Pink

  // Text Colors
  static const Color textPrimary = Color(0xFF171717); // Nearly black
  static const Color textSecondary = Color(0xFF525252); // Dark gray

  // Glassmorphism
  static Color glassBorder = const Color.fromARGB(255, 86, 47, 0).withValues(alpha: 0.3); // Subtle dark border
  static const Color glassBackground = Color(0x0A000000); // Subtle dark tint
  static const Color glassBackgroundDark = Color(0x1A000000); // Stronger dark tint
}

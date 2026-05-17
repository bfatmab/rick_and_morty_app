import 'package:flutter/material.dart';

class AppTheme {
  // instanca olusturmayı engellemek ıcın ,utility class
  AppTheme._();

  // 🎨 Renkler
  static const Color primary = Color(0xFF66FCF1);
  static const Color secondary = Color(0xFF45A29E);
  static const Color background = Color(0xFF0F141A);
  static const Color surface = Color(0xFF1A2330);
  static const Color onSurface = Colors.white;
  static const Color error = Color(0xFFCF6679);
  static const Color tertiary = Color(0xFF9D4EDD);

  // 🌙 Dark theme
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Inter',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,

        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: secondary,
          surface: surface,
          onPrimary: Colors.black,
          onSurface: onSurface,
          error: error,
          tertiary: tertiary,
        ),

        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: AppTheme.primary,
          ),
        ),

        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppTheme.surface,
          indicatorColor: AppTheme.primary.withValues(alpha: 0.2),

          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: AppTheme.primary);
            }
            return const TextStyle(color: Colors.white70);
          }),

          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppTheme.primary);
            }
            return const IconThemeData(color: Colors.white70);
          }),
        ),
      );
}
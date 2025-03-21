import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData defaultThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    //font family
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    iconTheme: IconThemeData(opacity: 0.7),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none, // Invisible border

      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none, // Invisible border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none, // Invisible border
      ),
      hintStyle: TextStyle(
        color: AppColors.grey.withValues(alpha: 0.4),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: AppColors.appBlackText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: AppColors.black,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        color: AppColors.appBlackText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.black,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(color: AppColors.green, fontSize: 16),

      /// material default text
      bodyMedium: TextStyle(
        color: AppColors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),
  );
}

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

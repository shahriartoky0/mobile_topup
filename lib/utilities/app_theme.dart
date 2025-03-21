import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData defaultThemeData = ThemeData(
    useMaterial3: true, fontFamily: 'quicksand',
    //font family
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    iconTheme: IconThemeData(opacity: 0.6),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
     
        color: AppColors.grey,
        fontSize: 14 ,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)  ,
        borderSide: BorderSide.none, // Invisible border
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)  ,
        borderSide: BorderSide.none, // Invisible border
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0)  ,
        borderSide: BorderSide.none, // Invisible border
      ),
      hintStyle: TextStyle(
        
        color: AppColors.primaryColor.withValues(alpha: 0.7),
        fontSize: 14 ,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
         
        fontSize: 18 ,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.primaryColor,
        fontSize: 14 ,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 12 ,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.primaryColor,
        fontSize: 16 ,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.black,
        fontSize: 10 ,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontFamily: 'quicksand',
        color: AppColors.white,
        fontSize: 16 ,
      ),
      bodyMedium: TextStyle(fontFamily: 'quicksand', color: AppColors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8  )),
      ),
    ),
  );
}

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
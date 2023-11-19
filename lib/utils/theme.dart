import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.C_0FC36D,
        unselectedItemColor: AppColors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark)),
      textTheme: const TextTheme(
          //display
          displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter'),
          displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter'),
          //title
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          labelMedium: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          //body
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          bodySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')));

  static ThemeData darkTheme = ThemeData(
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.black,
      ),
      scaffoldBackgroundColor: AppColors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.C_0FC36D,
        unselectedItemColor: AppColors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.black,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light)),
      textTheme: TextTheme(
          //display
          displayLarge: const TextStyle(
              color: AppColors.black,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter'),
          displayMedium: const TextStyle(
              color: AppColors.black,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          displaySmall: const TextStyle(
              color: AppColors.black,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          //headline
          headlineLarge: const TextStyle(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          headlineMedium: const TextStyle(
              color: AppColors.black,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          headlineSmall: const TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter'),
          //title
          titleLarge: const TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
          titleMedium: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          titleSmall: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          //label
          labelLarge: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          labelMedium: const TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          labelSmall: const TextStyle(
              color: AppColors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          //body
          bodyLarge: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          bodyMedium: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter'),
          bodySmall: TextStyle(
              color: AppColors.passiveWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter')));
}

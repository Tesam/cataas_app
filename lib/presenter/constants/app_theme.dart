import 'package:cataas_app/presenter/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData getTheme() {
    return lightThemeData.copyWith(
      textTheme: textThemeMobile,
      primaryColor: AppColors.primary,
    );
  }

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
    ),
  );

  static TextTheme textThemeMobile = const TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
      height: 28,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24,
    )
  );
}
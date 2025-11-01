// App Theme
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/ui_constants.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/core/utils/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColorsLight.primaryBlue,
      scaffoldBackgroundColor: AppColorsLight.lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorsLight.primaryBlue,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStylesLight.appBarTitle,
        iconTheme: IconThemeData(color: AppColorsLight.white),
      ),
      cardTheme: CardThemeData(
        color: AppColorsLight.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiConstants.cardRadius),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: UiConstants.horizontalPadding,
          vertical: UiConstants.verticalPadding,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStylesLight.movieTitleLarge,
        headlineMedium: AppTextStylesLight.movieTitleMedium,
        titleMedium: AppTextStylesLight.descriptionHeading,
        bodyLarge: AppTextStylesLight.descriptionBody,
        bodyMedium: AppTextStylesLight.genreTag,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColorsDark.primaryCyan,
      scaffoldBackgroundColor: AppColorsDark.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorsDark.appBarBackground,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStylesDark.appBarTitle,
        iconTheme: IconThemeData(color: AppColorsDark.iconCyan),
      ),
      cardTheme: CardThemeData(
        color: AppColorsDark.cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiConstants.cardRadius),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: UiConstants.horizontalPadding,
          vertical: UiConstants.verticalPadding,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: AppTextStylesDark.movieTitleLarge,
        headlineMedium: AppTextStylesDark.movieTitleMedium,
        titleMedium: AppTextStylesDark.descriptionHeading,
        bodyLarge: AppTextStylesDark.descriptionBody,
        bodyMedium: AppTextStylesDark.genreTag,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/utils/app_colors.dart';

// App Text Styles - Light Theme
class AppTextStylesLight {
  const AppTextStylesLight._();
  // App Bar Title
  static TextStyle appBarTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.white,
    letterSpacing: 0.5,
  );

  // Movie Title (Large)
  static TextStyle movieTitleLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.primaryText,
    letterSpacing: 0.5,
  );

  // Movie Title (Medium - List Item)
  static TextStyle movieTitleMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.primaryText,
    letterSpacing: 0.3,
  );

  // Rating Text
  static TextStyle rating = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColorsLight.primaryText,
  );

  // Genre Tag
  static TextStyle genreTag = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.secondaryText,
    letterSpacing: 0.3,
  );

  // Description Heading
  static TextStyle descriptionHeading = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsLight.primaryText,
    letterSpacing: 0.3,
  );

  // Description Body
  static TextStyle descriptionBody = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColorsLight.secondaryText,
    height: 1.5,
    letterSpacing: 0.2,
  );

  // Button Text
  static TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsLight.secondaryText,
    letterSpacing: 0.5,
  );
}

// App Text Styles - Dark Theme
class AppTextStylesDark {
  AppTextStylesDark._();
  // App Bar Title
  static TextStyle appBarTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.primaryCyan,
    letterSpacing: 0.5,
  );

  // Movie Title (Large)
  static TextStyle movieTitleLarge = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.primaryText,
    letterSpacing: 0.5,
  );

  // Movie Title (Medium - List Item)
  static TextStyle movieTitleMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.primaryText,
    letterSpacing: 0.3,
  );

  // Rating Text
  static TextStyle rating = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColorsDark.primaryText,
  );

  // Genre Tag
  static TextStyle genreTag = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.secondaryText,
    letterSpacing: 0.3,
  );

  // Description Heading
  static TextStyle descriptionHeading = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColorsDark.primaryText,
    letterSpacing: 0.3,
  );

  // Description Body
  static TextStyle descriptionBody = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColorsDark.secondaryText,
    height: 1.5,
    letterSpacing: 0.2,
  );

  // Button Text
  static TextStyle buttonText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColorsDark.secondaryText,
    letterSpacing: 0.5,
  );
}

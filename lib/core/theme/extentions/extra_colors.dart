import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class ExtraColors {
  const ExtraColors._({required this.categoryChipBackground});
  final Color categoryChipBackground;
  factory ExtraColors._light() {
    return ExtraColors._(
      categoryChipBackground: AppColorsLight.categoryChipBackground,
    );
  }
  factory ExtraColors._dark() {
    return ExtraColors._(
      categoryChipBackground: AppColorsDark.categoryChipBackground,
    );
  }
}

extension ExtraColorsExtension on ThemeData {
  ExtraColors get extraColors {
    if (brightness == Brightness.dark) return ExtraColors._dark();
    return ExtraColors._light();
  }
}

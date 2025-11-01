import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/extentions/extra_colors.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  bool get isDark => theme.brightness == Brightness.dark;
  ExtraColors get extraColors => theme.extraColors;
}

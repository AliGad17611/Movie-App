import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/ui_constants.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: context.extraColors.categoryChipBackground,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(UiConstants.imageCardBorderRadius),
      ),
      child: Text(label, style: context.theme.textTheme.bodyMedium),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: context.theme.primaryColor),
        horizontalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor.withValues(alpha: 0.7),
              ),
            ),
            Text(value, style: context.theme.textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}

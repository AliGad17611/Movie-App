import 'package:flutter/material.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({super.key, required this.overview});
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Overview", style: context.theme.textTheme.titleMedium),
        verticalSpace(8),
        Text(
          overview,
          style: context.theme.textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

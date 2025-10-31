import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/ui_constants.dart';
import 'package:movie_app/core/utils/app_colors.dart';

class MovieImageContainer extends StatelessWidget {
  const MovieImageContainer({super.key, required this.posterPath});
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UiConstants.imageCardWidth,
      height: UiConstants.imageCardHeight,
      decoration: BoxDecoration(
        color: AppColorsLight.imagePlaceholder,
        borderRadius: BorderRadius.circular(UiConstants.imageCardRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UiConstants.imageCardBorderRadius),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500/$posterPath',

          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.image_not_supported);
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

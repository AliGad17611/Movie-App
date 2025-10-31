import 'package:cached_network_image/cached_network_image.dart';
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
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/$posterPath',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_not_supported),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

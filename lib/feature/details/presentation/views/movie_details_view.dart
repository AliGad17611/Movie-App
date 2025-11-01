import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/ui_constants.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/details/presentation/widgets/movie_details_card.dart';
import 'package:movie_app/feature/details/presentation/widgets/movie_overview.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/presentation/views/widgets/movie_image_container.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: UiConstants.horizontalPadding,
          vertical: UiConstants.verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            Center(
              child: MovieImageContainer(
                posterPath: movie.posterPath,
                width: 200.w,
                height: 300.h,
              ),
            ),
            verticalSpace(24),

            // Movie Title
            Align(
              alignment: Alignment.center,
              child: Text(
                movie.title,
                style: context.theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),

            verticalSpace(16),

            // Rating Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: AppColorsLight.starYellow, size: 24.sp),
                horizontalSpace(8),
                Text(
                  "${movie.voteAverage.toStringAsFixed(1)}/10",
                  style: context.theme.textTheme.headlineMedium,
                ),
                horizontalSpace(16),
                Text(
                  "(${movie.voteCount} votes)",
                  style: context.theme.textTheme.bodyMedium,
                ),
              ],
            ),
            verticalSpace(20),

            // Movie Details Card
            MovieDetailsCard(movie: movie),
            verticalSpace(24),

            // Overview Section
          MovieOverview(overview: movie.overview),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/constants/ui_constants.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/feature/home/presentation/views/widgets/category_chip.dart';
import 'package:movie_app/feature/home/presentation/views/widgets/movie_image_container.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetails, arguments: movie);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UiConstants.horizontalPadding,
            vertical: UiConstants.verticalPadding,
          ),
          child: Row(
            children: [
              MovieImageContainer(
                posterPath: movie.posterPath,
                width: UiConstants.imageCardWidth,
                height: UiConstants.imageCardHeight,
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      movie.title,
                      style: context.theme.textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  verticalSpace(4),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColorsLight.starYellow,
                        size: 18.sp,
                      ),
                      horizontalSpace(4),
                      Text(
                        "${movie.voteAverage.toStringAsFixed(1)}/10",
                        style: context.theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  verticalSpace(8),
                  CategoryChip(label: movie.originalLanguage),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

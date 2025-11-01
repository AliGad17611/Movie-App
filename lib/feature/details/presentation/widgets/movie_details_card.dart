import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helper/spacing.dart';
import 'package:movie_app/feature/details/presentation/helper/format_date.dart';
import 'package:movie_app/feature/details/presentation/widgets/info_item.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';

class MovieDetailsCard extends StatelessWidget {
  const MovieDetailsCard({super.key, required this.movie});
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Release Date and Language
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InfoItem(
                    icon: Icons.calendar_today,
                    label: "Release Date",
                    value: formatDate(movie.releaseDate),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: InfoItem(
                    icon: Icons.language,
                    label: "Language",
                    value: movie.originalLanguage.toUpperCase(),
                  ),
                ),
              ],
            ),
            verticalSpace(16),

            // Popularity
            InfoItem(
              icon: Icons.trending_up,
              label: "Popularity",
              value: movie.popularity.toStringAsFixed(1),
            ),
            verticalSpace(16),
            // Video Available
            if (movie.video)
              InfoItem(
                icon: Icons.videocam,
                label: "Video",
                value: "Available",
              ),
          ],
        ),
      ),
    );
  }
}

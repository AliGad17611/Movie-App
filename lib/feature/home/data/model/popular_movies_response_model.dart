import 'package:hive/hive.dart';
import 'movie_model.dart';

part 'popular_movies_response_model.g.dart';

@HiveType(typeId: 1)
class PopularMoviesResponseModel extends HiveObject {
  @HiveField(0)
  final int page;
  @HiveField(1)
  final List<MovieModel> results;
  @HiveField(2)
  final int totalPages;
  @HiveField(3)
  final int totalResults;

  PopularMoviesResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesResponseModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map(
            (movieJson) =>
                MovieModel.fromJson(movieJson as Map<String, dynamic>),
          )
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}

import 'movie_model.dart';

class PopularMoviesResponseModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  const PopularMoviesResponseModel({
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

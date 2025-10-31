import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/feature/home/data/model/popular_movies_response_model.dart';

class HomeLocalDataSource {
  HomeLocalDataSource();
  static const String _popularMoviesBoxName = 'popular_movies_box';
  static const String _popularMoviesKey = 'popular_movies_key';

  Future<void> homeLocalDataSourceInit() async {
    await Hive.openBox<PopularMoviesResponseModel>(_popularMoviesBoxName);
  }

  Future<PopularMoviesResponseModel?> getPopularMovies() async {
    final movies = Hive.box<PopularMoviesResponseModel>(
      _popularMoviesBoxName,
    ).get(_popularMoviesKey);
    return movies;
  }

  Future<void> savePopularMovies(
    PopularMoviesResponseModel popularMoviesResponseModel,
  ) async {
    final existingMovies = Hive.box<PopularMoviesResponseModel>(
      _popularMoviesBoxName,
    ).get(_popularMoviesKey);
    if (existingMovies != null) {
      final combinedResults = [
        ...existingMovies.results,
        ...popularMoviesResponseModel.results,
      ];
      final PopularMoviesResponseModel updatedModel =
          PopularMoviesResponseModel(
            page: popularMoviesResponseModel.page,
            results: combinedResults,
            totalPages: popularMoviesResponseModel.totalPages,
            totalResults: combinedResults.length,
          );

      await Hive.box<PopularMoviesResponseModel>(
        _popularMoviesBoxName,
      ).put(_popularMoviesKey, updatedModel);
    } else {
      await Hive.box<PopularMoviesResponseModel>(
        _popularMoviesBoxName,
      ).put(_popularMoviesKey, popularMoviesResponseModel);
    }
  }

  Future<void> clearPopularMovies() async {
    await Hive.box<PopularMoviesResponseModel>(_popularMoviesBoxName).clear();
  }
}

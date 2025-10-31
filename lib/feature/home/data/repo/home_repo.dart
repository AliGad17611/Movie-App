import 'package:dartz/dartz.dart';
import 'package:movie_app/config/logger/app_logger.dart';
import 'package:movie_app/core/constants/pagination_constants.dart';
import 'package:movie_app/core/errors/api_error_handler.dart';
import 'package:movie_app/core/errors/api_error_model.dart';
import 'package:movie_app/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:movie_app/feature/home/data/model/popular_movies_response_model.dart';

class HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepo(this.homeRemoteDataSource);
  Future<Either<ApiErrorModel, PopularMoviesResponseModel>>
  getPopularMovies() async {
    try {
      AppLogger.logInfo('Getting popular movies');
      final response = await homeRemoteDataSource.getPopularMovies(
        page: PaginationConstants.pageNumber,
        language: 'en-US',
      );
      AppLogger.logInfo('Popular movies: ${response.results.length}');
      return Right(response);
    } catch (e) {
      AppLogger.logInfo('Error getting popular movies: $e');
      return Left(ApiErrorHandler.handle(e));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/constants/pagination_constants.dart';
import 'package:movie_app/feature/home/data/model/popular_movies_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_remote_data_source.g.dart';

@RestApi()
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio) = _HomeRemoteDataSource;
  @GET(ApiEndpoints.getPopularMovies)
  Future<PopularMoviesResponseModel> getPopularMovies({
    @Query('page') int page = PaginationConstants.pageNumber,
    @Query('language') String language = 'en-US',
  });
}

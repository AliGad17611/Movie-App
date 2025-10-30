import 'package:envied/envied.dart';
part 'api_constants.g.dart';

@Envied(path: 'env/.env')
class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const int connectionTimeout = 10000;
  static const int receiveTimeout = 10000;
  static const int sendTimeout = 10000;
  @EnviedField(obfuscate: true,varName: 'API_TOKEN')
  static final String apiToken = 'Bearer ${_ApiConstants.apiToken}';

}
class ApiEndpoints {
  static const String getPopularMovies = 'movie/popular';
}
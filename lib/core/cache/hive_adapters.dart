import 'package:hive/hive.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/data/model/popular_movies_response_model.dart';

class HiveAdapters {
  static Future<void> registerAdapters() async {
    Hive.registerAdapter(PopularMoviesResponseModelAdapter());
    Hive.registerAdapter(MovieModelAdapter());
  }
}
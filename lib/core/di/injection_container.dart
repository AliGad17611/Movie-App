import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_factory.dart';
import 'package:movie_app/feature/home/data/data_sources/home_remote_data_source.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // home
  getIt.registerLazySingleton(() => HomeRemoteDataSource(getIt()));
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
}

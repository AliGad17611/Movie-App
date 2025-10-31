import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_factory.dart';
import 'package:movie_app/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:movie_app/feature/home/data/repo/home_repo.dart';
import 'package:movie_app/feature/home/presentation/cubit/home_cubit.dart';

final GetIt getIt = GetIt.instance;
Future<void> init() async {
  // home
  getIt.registerFactory(() => HomeCubit(getIt()));
  getIt.registerLazySingleton(() => HomeRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => HomeRepo(getIt()));
  // Core
  getIt.registerLazySingleton(() => DioFactory().dio);
}

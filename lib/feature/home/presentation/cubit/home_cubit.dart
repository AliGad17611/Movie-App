import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/pagination_constants.dart';
import 'package:movie_app/core/errors/api_error_model.dart';
import 'package:movie_app/feature/home/data/model/popular_movies_response_model.dart';
import 'package:movie_app/feature/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  Future<void> getPopularMovies() async {
    emit(HomeLoading());
    final result = await homeRepo.getPopularMovies();
    result.fold(
      (error) => emit(HomeError(apiErrorModel: error)),
      (movies) => emit(HomeLoaded(popularMoviesResponseModel: movies)),
    );
  }

  Future<void> loadMoreMovies() async {
    emit(MoreMoviesLoading());
    PaginationConstants.pageNumber++;
    final result = await homeRepo.getPopularMovies();
    result.fold(
      (error) => emit(MoreMoviesError(apiErrorModel: error)),
      (movies) => emit(MoreMoviesLoaded(popularMoviesResponseModel: movies)),
    );
  }
}

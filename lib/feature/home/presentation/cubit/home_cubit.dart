import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/pagination_constants.dart';
import 'package:movie_app/core/errors/api_error_model.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;
  List<MovieModel> _movies = [];
  bool _hasReachedMax = false;

  Future<void> getPopularMovies() async {
    emit(HomeLoading());
    final result = await homeRepo.getPopularMovies();
    result.fold((error) => emit(HomeError(apiErrorModel: error)), (response) {
      _movies = response.results;
      _hasReachedMax = PaginationConstants.pageNumber >= response.totalPages;
      emit(HomeLoaded(movies: _movies, hasReachedMax: _hasReachedMax));
    });
  }

  Future<void> loadMoreMovies() async {
    if (_hasReachedMax || state is! HomeLoaded) return;

    final currentState = state as HomeLoaded;
    emit(currentState.copyWith(isLoadingMore: true));

    PaginationConstants.pageNumber++;
    final result = await homeRepo.getPopularMovies();
    result.fold(
      (error) {
        PaginationConstants.pageNumber--; // Revert page number on error
        emit(currentState.copyWith(isLoadingMore: false));
      },
      (response) {
        _movies.addAll(response.results);
        _hasReachedMax = PaginationConstants.pageNumber >= response.totalPages;
        emit(
          HomeLoaded(
            movies: _movies,
            hasReachedMax: _hasReachedMax,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  Future<void> refreshMovies() async {
    emit(HomeLoading());
    _resetPagination();
    final result = await homeRepo.getPopularMovies();
    result.fold((error) => emit(HomeError(apiErrorModel: error)), (response) {
      _movies = response.results;
      _hasReachedMax = PaginationConstants.pageNumber >= response.totalPages;
      emit(HomeLoaded(movies: _movies, hasReachedMax: _hasReachedMax));
    });
  }

  void _resetPagination() {
    PaginationConstants.pageNumber = 1;
    _movies = [];
    _hasReachedMax = false;
  }
}

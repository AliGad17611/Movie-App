part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<MovieModel> movies;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const HomeLoaded({
    required this.movies,
    required this.hasReachedMax,
    this.isLoadingMore = false,
  });

  HomeLoaded copyWith({
    List<MovieModel>? movies,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return HomeLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object?> get props => [movies, hasReachedMax, isLoadingMore];
}

final class HomeError extends HomeState {
  final ApiErrorModel apiErrorModel;
  const HomeError({required this.apiErrorModel});
  @override
  List<Object?> get props => [apiErrorModel];
}

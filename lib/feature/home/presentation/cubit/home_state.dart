part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final PopularMoviesResponseModel popularMoviesResponseModel;
  const HomeLoaded({required this.popularMoviesResponseModel});
  @override
  List<Object?> get props => [popularMoviesResponseModel];
}
final class HomeError extends HomeState {
  final ApiErrorModel apiErrorModel;
  const HomeError({required this.apiErrorModel});
  @override
  List<Object?> get props => [apiErrorModel];
}
final class MoreMoviesLoading extends HomeState {}
final class MoreMoviesLoaded extends HomeState {
  final PopularMoviesResponseModel popularMoviesResponseModel;
  const MoreMoviesLoaded({required this.popularMoviesResponseModel});
  @override
  List<Object?> get props => [popularMoviesResponseModel];
}
final class MoreMoviesError extends HomeState {
  final ApiErrorModel apiErrorModel;
  const MoreMoviesError({required this.apiErrorModel});
  @override
  List<Object?> get props => [apiErrorModel];
}
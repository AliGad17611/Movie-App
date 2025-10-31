import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/injection_container.dart';
import 'package:movie_app/core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';
import 'package:movie_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:movie_app/feature/home/presentation/views/widgets/movie_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
            icon: Icon(context.isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => HomeCubit(getIt())..getPopularMovies(),
        child: const HomeViewBody(),
      ),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is HomeError) {
          return Center(child: Text(state.apiErrorModel.message));
        }
        if (state is HomeLoaded) {
          return ListView.builder(
            itemCount: state.popularMoviesResponseModel.results.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: state.popularMoviesResponseModel.results[index],
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

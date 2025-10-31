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

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final state = context.read<HomeCubit>().state;
    if (_isBottom &&
        state is HomeLoaded &&
        !state.isLoadingMore &&
        !state.hasReachedMax) {
      context.read<HomeCubit>().loadMoreMovies();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9); // Load more when 90% scrolled
  }

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
          return Column(
            children: [
              if (state.isLoadingMore)
                const Center(child: LinearProgressIndicator()),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) =>
                      MovieCard(movie: state.movies[index]),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

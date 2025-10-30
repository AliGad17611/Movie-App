import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/cubit/theme_cubit.dart';
import 'package:movie_app/core/theme/extentions/theme_extension.dart';

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
      body: Center(child: Text('Home View')),
    );
  }
}

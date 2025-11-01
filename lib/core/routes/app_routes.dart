import 'package:flutter/material.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/feature/details/presentation/views/movie_details_view.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/presentation/views/home_view.dart';

class AppRoutes {
  const AppRoutes._();
  static const AppRoutes instance = AppRoutes._();
  
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case Routes.movieDetails:
        return MaterialPageRoute(builder: (context) => MovieDetailsView(movie: settings.arguments as MovieModel));
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('404 Not Found'))));
    }
  }
}

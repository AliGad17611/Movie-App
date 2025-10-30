import 'package:flutter/material.dart';
import 'package:movie_app/core/di/injection_container.dart' as di;
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/movie_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MovieApp(appRoutes:  AppRoutes.instance));
}

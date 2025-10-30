import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/app_routes.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.appRoutes});
  final AppRoutes appRoutes;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movie App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
          theme: ThemeData(
            useMaterial3: true,
          ),
        );
      },
    );
  }
} 
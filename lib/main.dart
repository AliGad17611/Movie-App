import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app/core/cache/hive_adapters.dart';
import 'package:movie_app/core/di/injection_container.dart' as di;
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/movie_app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Hive.initFlutter();
  HiveAdapters.registerAdapters();
  await di.init();
  runApp(MovieApp(appRoutes: AppRoutes.instance));
}

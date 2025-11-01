import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_app/core/cache/hive_adapters.dart';
import 'package:movie_app/core/di/injection_container.dart' as di;
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/movie_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://680d7b804f0d232acf84f126227f1549@o4510287221948416.ingest.us.sentry.io/4510287226863616';
      options.tracesSampleRate = 1.0;
    },  appRunner: () => runApp(
      SentryWidget(
        child: MovieApp(appRoutes: AppRoutes.instance),
      ),
    ),
  );
}

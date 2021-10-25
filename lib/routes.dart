import 'package:clean_code_training/features/weather/presentation/weather_ui.dart';

import 'package:clean_code_training/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class Routes {
  static const String home = '/';
  static const String weather = '/weather';

}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        );
      },
    ),
    GoRoute(
      path: Routes.weather,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: WeatherUI(),
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) {
    return const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text('Route Not Found!'),
        ),
      ),
    );
  },
);

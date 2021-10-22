import 'package:clean_code_training/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/weather/presentation/weather_ui.dart';

class Routes {
  static const String home = '/';
  static const String weather = '/weather';
  static const String two = '/two';
  static const String three = '/three';
  static const String four = '/four';
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

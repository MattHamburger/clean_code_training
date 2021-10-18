import 'package:clean_code_training/features/feature_four/presentation/feature_four_ui.dart';
import 'package:clean_code_training/features/feature_one/presentation/feature_one_ui.dart';
import 'package:clean_code_training/features/feature_three/presentation/feature_three_ui.dart';
import 'package:clean_code_training/features/feature_two/presentation/feature_two_ui.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String home = '/';
  static const String one = '/one';
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
      path: Routes.one,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: FeatureOneUI(),
        );
      },
    ),
    GoRoute(
      path: Routes.two,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: FeatureTwoUI(),
        );
      },
    ),
    GoRoute(
      path: Routes.three,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: FeatureThreeUI(),
        );
      },
    ),
    GoRoute(
      path: Routes.four,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: FeatureFourUI(),
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

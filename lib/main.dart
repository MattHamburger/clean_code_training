import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

void main() {
  loadProviders();
  runApp(const TrainingApp());
}

class TrainingApp extends StatelessWidget {
  const TrainingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppProvidersContainer(
      providersContext: providersContext,
      onBuild: (context, _) {},
      child: MaterialApp.router(
        title: 'Training App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
      ),
    );
  }
}

import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

void main() {
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
        routeInformationParser: router.informationParser,
        routerDelegate: router.delegate,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}

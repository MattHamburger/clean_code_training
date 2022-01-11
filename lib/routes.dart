
import 'package:clean_code_training/home_page.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/age_feature/presentation/age_page.dart';




enum Routes {
  home,
  payments,
}

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        AppRoute(
          name: Routes.payments,
          path: 'last-login',
          builder: (context, state) => AgePage(),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Page404(error: state.error),
);

class Page404 extends StatelessWidget {
  const Page404({Key? key, required this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}

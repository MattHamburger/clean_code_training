
import 'package:clean_code_training/features/dictionary_feature/presentation/dictionary_ui.dart';
import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/age_feature/presentation/age_page.dart';




enum Routes {
  home,
  age,
  payment,
  dictionary
}

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        AppRoute(
          name: Routes.age,
          path: 'last-login',
          builder: (context, state) => const AgePage(),
        ),
        AppRoute(
          name: Routes.dictionary,
          path: 'last-login',
          builder: (context, state) => const DictionaryPage(),
        ),
        AppRoute(
          name: Routes.payment,
          path: 'last-login',
          builder: (context, state) => const PaymentsPage(),
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

import 'package:clean_code_training/features/age_calculator/presentation/age_display_page.dart';
import 'package:clean_code_training/features/dictionary_feature/presentation/dictionary_ui.dart';
import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/age_calculator/presentation/age_calculator_page.dart';

enum Routes { home, ageCalculator, ageDisplay, payment, dictionary }

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        AppRoute(
          name: Routes.ageCalculator,
          path: 'ageCalculator',
          builder: (context, state) => const AgeCalculatorPage(),
        ),
        AppRoute(
            name: Routes.ageDisplay,
            path: 'ageDisplay',
            builder: (context, state) => const AgeDisplayPage()),
        AppRoute(
          name: Routes.dictionary,
          path: 'dictionary',
          builder: (context, state) => const DictionaryPage(),
        ),
        AppRoute(
          name: Routes.payment,
          path: 'payment',
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

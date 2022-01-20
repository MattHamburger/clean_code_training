import 'package:clean_code_training/features/clean_dictionary/presentation/clean_dictionary_word_meanings_ui.dart';
import 'package:clean_code_training/features/guess_feature/gender_guess/presentation/gender_guess_page.dart';
import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/clean_dictionary/presentation/clean_dictionary_ui.dart';
import 'features/guess_feature/age_calculator/presentation/age_calculator_page.dart';
import 'features/guess_feature/age_calculator/presentation/age_display_page.dart';

enum Routes { home, ageCalculator,genderGuesser, ageDisplay, payment, dictionary, dictionaryMeanings }

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
            name: Routes.genderGuesser,
            path: 'genderDisplay',
            builder: (context, state) => const GenderGuessPage()),
        AppRoute(
            name: Routes.dictionary,
            path: 'dictionary',
            builder: (context, state) => const CleanDictionaryPage(),
            routes: [
              AppRoute(
                  name: Routes.dictionaryMeanings,
                  path: 'dictionaryMeanings',
                  builder: (context, state) => const CleanDictionaryWordMeaningsPage()
              )
            ]),
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

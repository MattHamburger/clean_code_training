import 'package:clean_code_training/features/clean_dictionary/presentation/dictionary_word_meanings_ui.dart';
import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'features/age_feature/presentation/age_page.dart';
import 'features/clean_dictionary/presentation/dictionary_ui.dart';

enum Routes { home, age, payment, dictionary, dictionaryMeanings }

final router = AppRouter<Routes>(
  routes: [
    AppRoute(
      name: Routes.home,
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        AppRoute(
          name: Routes.age,
          path: 'age',
          builder: (context, state) => const AgePage(),
        ),
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

import 'package:clean_code_training/features/age_calculator/model/age_calculator_viewmodel.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import 'age_calculator_presenter.dart';

class AgeCalculatorPage extends StatelessWidget {
  const AgeCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AgeCalculatorUI());
  }
}

class AgeCalculatorUI extends UI<AgeCalculatorViewModel> {
  AgeCalculatorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Material(
      child: Column(
        key: const Key('list'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter Your Name'),
          const TextField(
            key: Key('nameInput'),
            // onChanged: viewModel.name,
          ),
          ElevatedButton(
              onPressed: () => {router.to(Routes.ageDisplay)},
              child: const Text("Calculate Age")),
        ],
      ),
    );
  }

  @override
  AgePresenter create(PresenterBuilder<AgeCalculatorViewModel> builder) {
    return AgePresenter(builder: builder);
  }
}

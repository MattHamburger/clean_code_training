import 'package:clean_code_training/features/age_calculator/model/age_calculator_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';

import 'age_calculator_presenter.dart';

class AgeDisplayPage extends StatelessWidget {
  const AgeDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AgeDisplayUI()));
  }
}

class AgeDisplayUI extends UI<AgeCalculatorViewModel> {
  AgeDisplayUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AgeCalculatorViewModel viewModel) {
    final dropDownItems = viewModel.ageChecked
        .map((rightGuess, statement) => MapEntry(
            rightGuess,
            DropdownMenuItem<String>(
                key: Key(rightGuess),
                child: Text(statement),
                value: rightGuess,
                onTap: () {
                  viewModel.finalAgeChecked(statement);
                }),
          ),
        ).values.toList();
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Your age is ${viewModel.userAge}"),
          const SizedBox(
            height: 10,
          ),
          const Text("Is this the correct age?"),
          Center(
            child: DropdownButton(
                key: const Key('age_dropdown'),
                items: dropDownItems,
                value: viewModel.finalStatement,
                onChanged: (selection) {}),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            key: const Key('age_statement'),
            child: Text(
              viewModel.finalStatement,
            ),
          ),
        ],
      ),
    );
  }

  @override
  AgePresenter create(PresenterBuilder<AgeCalculatorViewModel> builder) {
    return AgePresenter(builder: builder);
  }
}

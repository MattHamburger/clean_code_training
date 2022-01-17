import 'package:clean_code_training/features/age_calculator/model/age_calculator_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'package:flutter/material.dart';

import 'age_calculator_page.dart';

class AgeDisplayPage extends StatelessWidget {
  const AgeDisplayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AgeDisplayUI());
  }
}

class AgeDisplayUI extends UI<AgeCalculatorViewModel> {
  AgeDisplayUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, AgeCalculatorViewModel viewModel) {
    return  Material(
      child: Center(
          child: Text("Your age is ${viewModel.userAge}"),
        ),
    );
  }

  @override
  AgePresenter create(PresenterBuilder<AgeCalculatorViewModel> builder) {
    return AgePresenter(builder: builder);
  }
}


import 'package:clean_code_training/features/guess_feature/gender_guess/model/gender_guess_viewmodel.dart';

import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import 'age_guess_presenter.dart';

class GenderGuessPage extends StatelessWidget {
  const GenderGuessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GenderGuessUI());
  }
}

class GenderGuessUI extends UI<GenderViewModel> {
  GenderGuessUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, GenderViewModel viewModel) {
    return  Material(
      child: Center(
        child: Text("Your Gender is ${viewModel.userGender}"),
      ),
    );
  }


  @override
  GenderPresenter create(PresenterBuilder<GenderViewModel> builder) {
    return GenderPresenter(builder: builder);
  }
}


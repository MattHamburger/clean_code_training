import 'package:clean_code_training/features/age_feature/model/age_viewmodel.dart';

import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AgeUI();
  }
}

class AgeUI extends UI<AgeViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Enter Your Name'),
          TextField(
            // onChanged: viewModel.name,
          ),
        ],
      ),
    );
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(PresenterBuilder<AgeViewModel> builder) {
    // TODO: implement create
    throw UnimplementedError();
  }
}

import 'package:clean_code_training/features/age_feature/model/age_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import '../../../providers.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AgeUI();
  }
}

class AgeUI extends UI<AgeViewModel> {
  AgeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter Your Name'),
          const TextField(
              // onChanged: viewModel.name,
              ),
          ElevatedButton(onPressed: () {}, child: const Text("Calculate Age"))
        ],
      ),
    );
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
      PresenterBuilder<AgeViewModel> builder) {
    return AgePresenter(builder: builder);
  }
}

class AgePresenter extends Presenter<AgeViewModel, Output, UseCase> {
  AgePresenter({required PresenterBuilder<AgeViewModel> builder})
      : super(builder: builder, provider: ageUseCaseProvider);

  @override
  AgeViewModel createViewModel(UseCase<Entity> useCase, Output output) {
    return AgeViewModel(age: "", name: (name) {});
  }

  @override
  subscribe(ref) => EmptyOutput();
}

class EmptyOutput extends Output {
  @override
  List<Object?> get props => [];
}

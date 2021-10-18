import 'package:clean_code_training/features/feature_three/domain/feature_three_view_model.dart';
import 'package:clean_code_training/features/feature_three/presentation/feature_three_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class FeatureThreeUI extends UI<FeatureThreeViewModel> {
  FeatureThreeUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<FeatureThreeViewModel> builder,
  ) {
    return FeatureThreePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, FeatureThreeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 3'),
      ),
      body: const Center(
        child: Text('Feature Three'),
      ),
    );
  }
}

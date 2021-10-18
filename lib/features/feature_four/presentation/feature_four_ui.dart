import 'package:clean_code_training/features/feature_four/domain/feature_four_view_model.dart';
import 'package:clean_code_training/features/feature_four/presentation/feature_four_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class FeatureFourUI extends UI<FeatureFourViewModel> {
  FeatureFourUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<FeatureFourViewModel> builder,
  ) {
    return FeatureFourPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, FeatureFourViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 4'),
      ),
      body: const Center(
        child: Text('Feature One'),
      ),
    );
  }
}

import 'package:clean_code_training/features/feature_two/domain/feature_two_view_model.dart';
import 'package:clean_code_training/features/feature_two/presentation/feature_two_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class FeatureTwoUI extends UI<FeatureTwoViewModel> {
  FeatureTwoUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<FeatureTwoViewModel> builder,
  ) {
    return FeatureTwoPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, FeatureTwoViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 2'),
      ),
      body: const Center(
        child: Text('Feature Two'),
      ),
    );
  }
}

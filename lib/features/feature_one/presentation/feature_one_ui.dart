import 'package:clean_code_training/features/feature_one/domain/feature_one_view_model.dart';
import 'package:clean_code_training/features/feature_one/presentation/feature_one_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class FeatureOneUI extends UI<FeatureOneViewModel> {
  FeatureOneUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<FeatureOneViewModel> builder,
  ) {
    return FeatureOnePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, FeatureOneViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feature 1'),
      ),
      body: const Center(
        child: Text('Feature One'),
      ),
    );
  }
}

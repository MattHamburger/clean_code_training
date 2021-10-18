import 'package:clean_code_training/features/feature_one/domain/feature_one_use_case.dart';
import 'package:clean_code_training/features/feature_one/domain/feature_one_view_model.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_use_case.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureThreePresenter extends Presenter<FeatureThreeViewModel,
    FeatureThreeUIOutput, FeatureThreeUseCase> {
  FeatureThreePresenter({
    required PresenterBuilder<FeatureThreeViewModel> builder,
  }) : super(
          builder: builder,
          provider: featureThreeUseCaseProvider,
        );

  @override
  FeatureThreeViewModel createViewModel(
    FeatureThreeUseCase useCase,
    FeatureThreeUIOutput output,
  ) {
    return FeatureThreeViewModel();
  }
}

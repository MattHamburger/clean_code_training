import 'package:clean_code_training/features/feature_four/domain/feature_four_use_case.dart';
import 'package:clean_code_training/features/feature_four/domain/feature_four_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureFourPresenter extends Presenter<FeatureFourViewModel,
    FeatureFourUIOutput, FeatureFourUseCase> {
  FeatureFourPresenter({
    required PresenterBuilder<FeatureFourViewModel> builder,
  }) : super(
          builder: builder,
          provider: featureFourUseCaseProvider,
        );

  @override
  FeatureFourViewModel createViewModel(
    FeatureFourUseCase useCase,
    FeatureFourUIOutput output,
  ) {
    return FeatureFourViewModel();
  }
}

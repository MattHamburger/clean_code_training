import 'package:clean_code_training/features/feature_two/domain/feature_two_use_case.dart';
import 'package:clean_code_training/features/feature_two/domain/feature_two_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureTwoPresenter extends Presenter<FeatureTwoViewModel,
    FeatureTwoUIOutput, FeatureTwoUseCase> {
  FeatureTwoPresenter({
    required PresenterBuilder<FeatureTwoViewModel> builder,
  }) : super(
          builder: builder,
          provider: featureTwoUseCaseProvider,
        );

  @override
  FeatureTwoViewModel createViewModel(
    FeatureTwoUseCase useCase,
    FeatureTwoUIOutput output,
  ) {
    return FeatureTwoViewModel();
  }
}

import 'package:clean_code_training/features/feature_one/domain/feature_one_use_case.dart';
import 'package:clean_code_training/features/feature_one/domain/feature_one_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureOnePresenter extends Presenter<FeatureOneViewModel,
    FeatureOneUIOutput, FeatureOneUseCase> {
  FeatureOnePresenter({
    required PresenterBuilder<FeatureOneViewModel> builder,
  }) : super(
          builder: builder,
          provider: featureOneUseCaseProvider,
        );

  @override
  FeatureOneViewModel createViewModel(
    FeatureOneUseCase useCase,
    FeatureOneUIOutput output,
  ) {
    return FeatureOneViewModel();
  }
}

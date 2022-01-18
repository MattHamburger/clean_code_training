import 'package:clean_code_training/features/age_calculator/domain/age_calculator_usecase.dart';
import 'package:clean_code_training/features/age_calculator/model/age_calculator_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import '../../../providers.dart';

class AgePresenter extends Presenter<AgeCalculatorViewModel, AgeUIOutput,
    AgeCalculatorUseCase> {
  AgePresenter({required PresenterBuilder<AgeCalculatorViewModel> builder})
      : super(builder: builder, provider: ageUseCaseProvider);

  @override
  AgeCalculatorViewModel createViewModel(
      AgeCalculatorUseCase useCase, AgeUIOutput output) {
    return AgeCalculatorViewModel(userAge: output.userAge, userName: (name) {});
  }
  @override
  void onLayoutReady(context, useCase) {
    useCase.onAgeLoad();
  }
}

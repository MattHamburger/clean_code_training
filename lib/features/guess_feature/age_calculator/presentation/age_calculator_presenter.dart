import 'package:clean_code_training/features/guess_feature/age_calculator/domain/age_calculator_usecase.dart';
import 'package:clean_code_training/features/guess_feature/age_calculator/model/age_calculator_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import '../../../../providers.dart';

class AgePresenter extends Presenter<AgeCalculatorViewModel, AgeUIOutput,
    AgeCalculatorUseCase> {
  AgePresenter({required PresenterBuilder<AgeCalculatorViewModel> builder})
      : super(builder: builder, provider: ageUseCaseProvider);

  @override
  AgeCalculatorViewModel createViewModel(
      AgeCalculatorUseCase useCase, AgeUIOutput output) {
    return AgeCalculatorViewModel(
        ageChecked: output.ageChecked.isEmpty
            ? {
                '': 'No statement',
              }
            : output.ageChecked,
        userAge: output.userAge.toString(),
        finalStatement: output.finalStatement,
        finalAgeChecked: (age) {
          useCase.onAgeChange(age);
        });
  }

  @override
  void onLayoutReady(context, useCase) {
    useCase.onAgeLoad();
  }
}

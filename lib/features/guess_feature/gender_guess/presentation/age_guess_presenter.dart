import 'package:clean_code_training/features/guess_feature/gender_guess/domain/gender_guess_usecase.dart';
import 'package:clean_code_training/features/guess_feature/gender_guess/model/gender_guess_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import '../../../../providers.dart';

class GenderPresenter extends Presenter<GenderViewModel, GenderGuessUIOutput, GenderGuessUseCase> {
  GenderPresenter({required PresenterBuilder<GenderViewModel> builder})
      : super(builder: builder, provider: genderUseCaseProvider);

  @override
  GenderViewModel createViewModel(GenderGuessUseCase useCase,GenderGuessUIOutput output) {
    return GenderViewModel(userGender: output.userGender);
  }
  @override
  void onLayoutReady(context, useCase) {
    useCase.onGenderLoad();
  }
}

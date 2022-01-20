import 'package:clean_code_training/features/guess_feature/gender_guess/domain/gender_guess_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GenderGuessUseCase initial state and actions', () async {
    final useCase = GenderGuessUseCase();
    var currentOutput = useCase.getOutput<GenderGuessUIOutput>();
    expect(currentOutput, GenderGuessUIOutput(userGender: ''));

    await useCase.onGenderLoad();
    currentOutput = useCase.getOutput<GenderGuessUIOutput>();

    expect(currentOutput.userGender, "male");

    await useCase.onGenderChange("female");
    currentOutput = useCase.getOutput<GenderGuessUIOutput>();
    expect(currentOutput.userGender, "female");
  });
}

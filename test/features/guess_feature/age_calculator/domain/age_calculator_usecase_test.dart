

import 'package:clean_code_training/features/guess_feature/age_calculator/domain/age_calculator_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AgeUseCase initial state and actions', () async {
    final useCase = AgeCalculatorUseCase();
    var currentOutput = useCase.getOutput<AgeUIOutput>();
    expect(currentOutput,
        AgeUIOutput(userAge: 0, ageChecked: const {}, finalStatement: ''));

    await useCase.onAgeLoad();
    currentOutput = useCase.getOutput<AgeUIOutput>();

    expect(currentOutput.userAge, 50);
    expect(currentOutput.ageChecked, const {
      "The age is correct":'correct',
      'The age is incorrect':'incorrect'
    });

    await useCase.onAgeChange("The age is correct");
    currentOutput = useCase.getOutput<AgeUIOutput>();
    expect(currentOutput.finalStatement,"The age is correct");
  });
}

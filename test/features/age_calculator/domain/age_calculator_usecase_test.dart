import 'package:clean_code_training/features/age_calculator/domain/age_calculator_usecase.dart';

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
      'correct': "The age is correct",
      'incorrect': 'The age is incorrect'
    });

    await useCase.onAgeChange("75","correct");
    currentOutput = useCase.getOutput<AgeUIOutput>();

    expect(currentOutput.userAge, 75);
    expect(currentOutput.finalStatement,"correct");
  });
}

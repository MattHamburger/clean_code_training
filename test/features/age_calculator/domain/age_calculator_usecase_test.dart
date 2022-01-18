import 'package:clean_code_training/features/age_calculator/domain/age_calculator_usecase.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AgeUseCase initial state and actions', () async {
    final useCase = AgeCalculatorUseCase();
    var currentOutput = useCase.getOutput<AgeUIOutput>();
    expect(currentOutput, AgeUIOutput(userAge: ''));

    await useCase.onAgeLoad();
    currentOutput = useCase.getOutput<AgeUIOutput>();
    expect(currentOutput.userAge, '50');


    await useCase.onAgeChange('75');
    currentOutput = useCase.getOutput<AgeUIOutput>();
    expect(currentOutput.userAge, '75');
  });
}

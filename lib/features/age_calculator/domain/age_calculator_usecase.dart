import 'package:clean_framework/clean_framework_providers.dart';

import 'age_calculator_entity.dart';

class AgeCalculatorUseCase extends UseCase<AgeCalculatorEntity> {
  AgeCalculatorUseCase()
      : super(entity: AgeCalculatorEntity(), outputFilters: {
          AgeUIOutput: (AgeCalculatorEntity entity) =>
              AgeUIOutput(userAge: entity.userAge)
        });
}

class AgeUIOutput extends Output {
  final String userAge;

  AgeUIOutput({required this.userAge});

  @override
  List<Object?> get props => [userAge];
}

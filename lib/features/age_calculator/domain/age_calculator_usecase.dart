import 'package:clean_framework/clean_framework_providers.dart';

import 'age_calculator_entity.dart';

class AgeCalculatorUseCase extends UseCase<AgeCalculatorEntity> {
  AgeCalculatorUseCase()
      : super(entity: AgeCalculatorEntity(), outputFilters: {
          AgeUIOutput: (AgeCalculatorEntity entity) =>
              AgeUIOutput(userAge: entity.userAge)
        });

  Future<void> onAgeLoad() async {
    entity = entity.merge(userAge: '50');
  }

  Future<void> onAgeChange(String changedAge) async {
    entity = entity.merge(userAge: changedAge);
  }
}

class AgeUIOutput extends Output {
  final String userAge;

  AgeUIOutput({required this.userAge});

  @override
  List<Object?> get props => [userAge];
}

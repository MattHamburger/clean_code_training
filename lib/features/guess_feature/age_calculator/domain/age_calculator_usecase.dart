import 'package:clean_framework/clean_framework_providers.dart';

import 'age_calculator_entity.dart';

class AgeCalculatorUseCase extends UseCase<AgeCalculatorEntity> {
  AgeCalculatorUseCase()
      : super(entity: AgeCalculatorEntity(), outputFilters: {
          AgeUIOutput: (AgeCalculatorEntity entity) => AgeUIOutput(
              ageChecked: entity.ageChecked,
              userAge: entity.userAge,

              finalStatement: entity.finalStatement)
        });

  Future<void> onAgeLoad() async {
    entity = entity.merge(
        userAge: 50,
        ageChecked: const {
          'correct': "The age is correct",
          'incorrect': 'The age is incorrect'
        },
        finalStatement: "correct");
  }

  Future<void> onAgeChange(String finalStatement) async {
    entity = entity.merge(finalStatement: finalStatement);
  }
}

class AgeUIOutput extends Output {
  final Map<String, String> ageChecked;
  final int userAge;
  final String finalStatement;

  AgeUIOutput(
      {required this.userAge,
      required this.ageChecked,
      required this.finalStatement});

  @override
  List<Object?> get props => [userAge, ageChecked, finalStatement];
}

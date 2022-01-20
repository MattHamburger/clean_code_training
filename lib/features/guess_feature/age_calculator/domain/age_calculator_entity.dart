import 'package:clean_framework/clean_framework_providers.dart';

class AgeCalculatorEntity extends Entity {
  final Map<String, String> ageChecked;
  final int userAge;
  final String finalStatement;

  AgeCalculatorEntity(
      {this.ageChecked = const {}, this.userAge = 0, this.finalStatement = ''});

  @override
  List<Object?> get props => [ageChecked,userAge,finalStatement];

  AgeCalculatorEntity merge(
          {Map<String, String>? ageChecked,
          int? userAge,
          String? finalStatement}) =>
      AgeCalculatorEntity(
          ageChecked: ageChecked ?? this.ageChecked,
          userAge: userAge ?? this.userAge,
          finalStatement: finalStatement ?? this.finalStatement);
}

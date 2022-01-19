import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class AgeCalculatorViewModel extends ViewModel {
  final Map<String, String> ageChecked;
  final String userAge;
  final String finalStatement;
  final ValueChanged<String> finalAgeChecked;

  AgeCalculatorViewModel(
      {required this.userAge,
      required this.ageChecked,
      required this.finalAgeChecked,
      required this.finalStatement});

  @override
  List<Object?> get props => [userAge, ageChecked, finalStatement,finalAgeChecked];
}

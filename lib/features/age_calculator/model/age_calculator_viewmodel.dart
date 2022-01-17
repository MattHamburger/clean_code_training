
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class AgeCalculatorViewModel extends ViewModel{
  final ValueChanged<String> userName;
  final String userAge;
  AgeCalculatorViewModel({required this.userName, required this.userAge});

  @override
  List<Object?> get props => [userAge];

}
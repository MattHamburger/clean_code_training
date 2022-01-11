import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PaymentsFormViewModel extends ViewModel {
  final ValueChanged<String> accountNumberInput;

  PaymentsFormViewModel({required this.accountNumberInput});

  @override
  List<Object?> get props => [];
}

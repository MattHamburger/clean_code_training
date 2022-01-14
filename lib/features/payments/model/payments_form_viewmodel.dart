import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PaymentsFormViewModel extends ViewModel {
  final ValueChanged<String> accountNumberInput;
  final String tempAccountNumber;

  PaymentsFormViewModel(
      {required this.accountNumberInput, required this.tempAccountNumber});

  @override
  List<Object?> get props => [tempAccountNumber];
}

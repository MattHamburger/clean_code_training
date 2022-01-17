import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PaymentsFormViewModel extends ViewModel {
  final ValueChanged<String> accountNumberInput;
  final Map<String, String> accountsList;
  final String selectedAccount;

  PaymentsFormViewModel(
      {required this.accountNumberInput,
      required this.accountsList,
      required this.selectedAccount});

  @override
  List<Object?> get props => [accountsList, selectedAccount];
}

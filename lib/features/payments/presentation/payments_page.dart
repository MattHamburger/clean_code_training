import 'package:clean_code_training/features/payments/model/payments_form_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import 'payments_form_presenter.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaymentsUI();
  }
}

class PaymentsUI extends UI<PaymentsFormViewModel> {
  PaymentsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Account Number'),
          TextField(
            key: const Key('account_number_input'),
            onChanged: viewModel.accountNumberInput,
          ),
        ],
      ),
    );
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
      PresenterBuilder<PaymentsFormViewModel> builder) {
    return PaymentsFormPresenter(builder: builder);
  }
}

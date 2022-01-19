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
    final dropDownItems = viewModel.accountsList
        .map(
          (account, name) => MapEntry(
            name,
            DropdownMenuItem<String>(
                key: Key(account),
                child: Text(name),
                value: account,
                onTap: () {
                  viewModel.accountNumberInput(account);
                }),
          ),
        )
        .values
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Account Number'),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: DropdownButton(
                  key: const Key('accounts_dropdown'),
                  items: dropDownItems,
                  value: viewModel.selectedAccount,
                  onChanged: (selection) {}),
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              key: const Key('selection'),
              child: Text(
                viewModel.selectedAccount,
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
      PresenterBuilder<PaymentsFormViewModel> builder) {
    return PaymentsFormPresenter(builder: builder);
  }
}

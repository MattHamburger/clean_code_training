import 'package:clean_code_training/features/payments/model/payments_form_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaymentsUI();
  }
}

class PaymentsUI extends UI<PaymentsFormViewModel> {
  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Account Number'),
          TextField(
            onChanged: viewModel.accountNumberInput,
          ),
        ],
      ),
    ); }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
      PresenterBuilder<PaymentsFormViewModel> builder) {
    // TODO: implement create

 throw UnimplementedError();
  }
}

// class PaymentsFormPresenter extends Presenter<PaymentsFormViewModel, Output, UseCase>{
//   PaymentsFormPresenter() : super(provider: Providerbuilder: (_){});

//   @override
//   PaymentsFormViewModel createViewModel(UseCase<Entity> useCase, Output output) {
//     // TODO: implement createViewModel
//     throw UnimplementedError();
//   }
// }

// class PresenterDummy extends Presenter {
//   PresenterDummy() : super({required PresenterBuilder<PaymentsFormViewModel> builder});

// @override
//   LastLoginUIOutput subscribe(_) =>
//       LastLoginUIOutput(lastLogin: DateTime.parse('2000-12-31'));

// }

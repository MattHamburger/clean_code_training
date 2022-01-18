import 'package:clean_code_training/features/payments/domain/payments_usecase.dart';
import 'package:clean_code_training/features/payments/model/payments_form_viewmodel.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PaymentsFormPresenter extends Presenter<PaymentsFormViewModel,
    PaymentsFormUIOutput, PaymentsUseCase> {
  PaymentsFormPresenter({
    required PresenterBuilder<PaymentsFormViewModel> builder,
  }) : super(builder: builder, provider: paymentsFormUseCaseProvider);

  @override
  PaymentsFormViewModel createViewModel(useCase, PaymentsFormUIOutput output) {
    return PaymentsFormViewModel(
        selectedAccount: output.selectedAccount,
        accountsList: output.accounts.isEmpty
            ? {
                '': 'No accounts',
              }
            : output.accounts,
        accountNumberInput: (account) {
          useCase.onSelectAccount(account);
        });
  }

  @override
  void onLayoutReady(context, useCase) {
    useCase.onPaymentsFormLoad();
  }
}

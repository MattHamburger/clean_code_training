import 'package:clean_code_training/features/payments/domain/payments_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('PaymentsUseCase initial state and actions', () async {
    final useCase = PaymentsUseCase();
    var currentOutput = useCase.getOutput<PaymentsFormUIOutput>();
    expect(currentOutput,
        PaymentsFormUIOutput(accounts: const {}, selectedAccount: ''));

    await useCase.onPaymentsFormLoad();

    currentOutput = useCase.getOutput<PaymentsFormUIOutput>();
    expect(currentOutput.accounts, allOf(isMap, hasLength(2)));
    expect(currentOutput.selectedAccount, isEmpty);

    await useCase.onSelectAccount('12345');
    currentOutput = useCase.getOutput<PaymentsFormUIOutput>();
    expect(currentOutput.selectedAccount, '12345');
  });
}

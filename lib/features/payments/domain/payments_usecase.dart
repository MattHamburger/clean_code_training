import 'package:clean_code_training/features/payments/domain/payments_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PaymentsUseCase extends UseCase<PaymentsEntity> {
  PaymentsUseCase()
      : super(entity: PaymentsEntity(), outputFilters: {
          PaymentsFormUIOutput: (PaymentsEntity entity) => PaymentsFormUIOutput(
              accounts: entity.accounts,
              selectedAccount: entity.selectedAccount)
        });

  Future<void> onPaymentsFormLoad() async {
    entity = entity.merge(
        accounts: const {'12345': 'Personal Savings', '09876': 'Credit Card'});
  }

  Future<void> onSelectAccount(String accountNumber) async {
    entity = entity.merge(selectedAccount: accountNumber);
  }
}

class PaymentsFormUIOutput extends Output {
  final Map<String, String> accounts;

  final String selectedAccount;

  PaymentsFormUIOutput({required this.accounts, required this.selectedAccount});

  @override
  List<Object?> get props => [accounts, selectedAccount];
}

import 'package:clean_framework/clean_framework_providers.dart';

// Its better for entities to allow default values
class PaymentsEntity extends Entity {
  final Map<String, String> accounts;
  final String selectedAccount;

  PaymentsEntity({this.accounts = const {}, this.selectedAccount = ''});

  @override
  List<Object?> get props => [accounts, selectedAccount];

  PaymentsEntity merge({
    Map<String, String>? accounts,
    String? selectedAccount,
  }) =>
      PaymentsEntity(
        accounts: accounts ?? this.accounts,
        selectedAccount: selectedAccount ?? this.selectedAccount,
      );
}

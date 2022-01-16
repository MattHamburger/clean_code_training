import 'package:clean_framework/clean_framework_providers.dart';

// Its better for entities to allow default values
class PaymentsEntity extends Entity {
  final String accountNumber;

  PaymentsEntity({this.accountNumber = 'adfgsdf'});

  @override
  List<Object?> get props => [accountNumber];
}

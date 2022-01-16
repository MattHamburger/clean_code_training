import 'package:clean_code_training/features/payments/domain/payments_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PaymentsUseCase extends UseCase<PaymentsEntity> {
  PaymentsUseCase()
      : super(entity: PaymentsEntity(), outputFilters: {
          PaymentsFormUIOutput: (PaymentsEntity entity) =>
              PaymentsFormUIOutput(number: entity.accountNumber)
        });
}

class PaymentsFormUIOutput extends Output {
  final String number;

  PaymentsFormUIOutput({required this.number});

  @override
  List<Object?> get props => [number];
}

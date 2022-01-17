
import 'package:clean_code_training/features/payments/domain/payments_usecase.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';

import 'features/age_calculator/domain/age_calculator_usecase.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final paymentsFormUseCaseProvider = UseCaseProvider((_) =>PaymentsUseCase());
final ageUseCaseProvider = UseCaseProvider((_)=>AgeCalculatorUseCase());
final dictionaryUseCaseProvider = UseCaseProvider((_) => UseCaseFake());

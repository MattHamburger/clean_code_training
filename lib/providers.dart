import 'package:clean_code_training/features/age_calculator/domain/age_calculator_usecase.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'features/clean_dictionary/domain/clean_dictionary_usecase.dart';
import 'features/payments/domain/payments_usecase.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final paymentsFormUseCaseProvider = UseCaseProvider((_) => PaymentsUseCase());
final ageUseCaseProvider = UseCaseProvider((_) => AgeCalculatorUseCase());
final dictionaryUseCaseProvider = UseCaseProvider((_) =>  CleanDictionaryUseCase());


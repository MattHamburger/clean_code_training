import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'features/clean_dictionary/domain/clean_dictionary_usecase.dart';
import 'features/payments/domain/payments_usecase.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final paymentsFormUseCaseProvider = UseCaseProvider((_) => PaymentsUseCase());
final ageUseCaseProvider = UseCaseProvider((_) => UseCaseFake());
final dictionaryUseCaseProvider = UseCaseProvider((_) =>  CleanDictionaryUseCase());

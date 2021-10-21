import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_code_training/features/rick_morty/domain/rick_morty_use_case.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;


final rickMortyUseCaseProvider =
    UseCaseProvider<RickMortyEntity, RickMortyUseCase>(
  (_) => RickMortyUseCase(),
);

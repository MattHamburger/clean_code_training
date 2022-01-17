import 'package:clean_framework/clean_framework_providers.dart';

import 'clean_dictionary_entity.dart';

class CleanDictionaryUseCase extends UseCase{
  CleanDictionaryUseCase() : super(entity: CleanDictionaryEntity(), outputFilters: {
    CleanDictionaryUIOutput: (CleanDictionaryEntity entity) =>
        CleanDictionaryUIOutput(wordMeanings: entity.wordMeanings)
  });

}

class CleanDictionaryUIOutput extends Output {
  final List<String> wordMeanings;

  CleanDictionaryUIOutput({required this.wordMeanings});

  @override
  List<Object?> get props => [wordMeanings];
}

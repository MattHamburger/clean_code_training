import 'package:clean_framework/clean_framework_providers.dart';

import 'clean_dictionary_entity.dart';

class CleanDictionaryUseCase extends UseCase<CleanDictionaryEntity>{
  CleanDictionaryUseCase() : super(entity: CleanDictionaryEntity(), outputFilters: {
    CleanDictionaryUIOutput: (CleanDictionaryEntity entity) =>
        CleanDictionaryUIOutput(wordMeanings: entity.wordMeanings)
  });

  Future<void> onDictionaryLoad() async {
    entity = entity.merge(
      wordMeanings: ["make a systematic list of (items of the same type)", "a complete list of items, typically one in alphabetical or other systematic order"]
    );
  }

  Future<void> onWordChanged(List<String> wordMeaning) async{
    entity = entity.merge(wordMeanings: wordMeaning);
  }

}

class CleanDictionaryUIOutput extends Output {
  final List<String> wordMeanings;

  CleanDictionaryUIOutput({required this.wordMeanings});

  @override
  List<Object?> get props => [wordMeanings];
}

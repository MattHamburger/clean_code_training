import 'package:clean_framework/clean_framework_providers.dart';

import 'clean_dictionary_entity.dart';

class CleanDictionaryUseCase extends UseCase<CleanDictionaryEntity>{
  CleanDictionaryUseCase() : super(entity: CleanDictionaryEntity(), outputFilters: {
    CleanDictionaryUIOutput: (CleanDictionaryEntity entity) =>
        CleanDictionaryUIOutput(wordMeanings: entity.wordMeanings, wordExamples: entity.wordExamples)
  });

  Future<void> onDictionaryLoad() async {
    entity = entity.merge(
      wordMeanings: ["make a systematic list of (items of the same type)", "a complete list of items, typically one in alphabetical or other systematic order"],
      wordExamples: ["It will be some time before the collection is fully catalogued.", "He also made a catalogue of the manuscripts at Anchin and annotated many of them."]
    );
  }

  Future<void> onWordChanged(word) async{
    entity = entity.merge(wordMeanings: word);
  }

}

class CleanDictionaryUIOutput extends Output {
  final List<String> wordMeanings;
  final List<String> wordExamples;

  CleanDictionaryUIOutput({required this.wordMeanings, required this.wordExamples});

  @override
  List<Object?> get props => [wordMeanings, wordExamples];
}

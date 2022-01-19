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

  Future<void> onPhoneticsRequested(bool request) async{
    entity = entity.merge(wordMeanings: request == true? ["relating to or done with the hands", "set of instructions"] : ["a pterosaur of the late Jurassic period, with a long slender head and neck and a very short tail", "the theory that life on the earth originated from microorganisms or chemical precursors of life present in outer space and able to initiate life on reaching a suitable environment"]);
  }

}

class CleanDictionaryUIOutput extends Output {
  final List<String> wordMeanings;
  final List<String> wordExamples;


  CleanDictionaryUIOutput({required this.wordMeanings, required this.wordExamples});

  @override
  List<Object?> get props => [wordMeanings, wordExamples];
}

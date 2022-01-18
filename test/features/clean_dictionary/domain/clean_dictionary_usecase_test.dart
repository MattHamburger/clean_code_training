import 'package:clean_code_training/features/clean_dictionary/domain/clean_dictionary_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Clean Dictionary UseCase Test', () async{
    final useCase = CleanDictionaryUseCase();
    var currentOutput = useCase.getOutput<CleanDictionaryUIOutput>();
    expect(currentOutput, CleanDictionaryUIOutput(wordMeanings: const []));

    await useCase.onDictionaryLoad();
    currentOutput = useCase.getOutput<CleanDictionaryUIOutput>();
    expect(currentOutput.wordMeanings, isNotEmpty);
    expect(currentOutput.wordMeanings, isList);
    expect(currentOutput.wordMeanings, hasLength(2));
    expect(currentOutput.wordMeanings.first, "make a systematic list of (items of the same type)");
    expect(currentOutput.wordMeanings.last, "a complete list of items, typically one in alphabetical or other systematic order");

    await useCase.onWordChanged(["relating to or done with the hands", "set of instructions"]);
    currentOutput = useCase.getOutput<CleanDictionaryUIOutput>();
    expect(currentOutput.wordMeanings.first, "relating to or done with the hands");
    expect(currentOutput.wordMeanings.last, "set of instructions");
  });
}

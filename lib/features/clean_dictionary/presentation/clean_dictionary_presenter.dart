import 'package:clean_code_training/features/clean_dictionary/domain/clean_dictionary_entity.dart';
import 'package:clean_code_training/features/clean_dictionary/domain/clean_dictionary_usecase.dart';
import 'package:clean_code_training/features/clean_dictionary/model/clean_dictionary_viewmodel.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class CleanDictionaryPresenter extends Presenter<CleanDictionaryViewModel,
    CleanDictionaryUIOutput, CleanDictionaryUseCase> {
  CleanDictionaryPresenter({required PresenterBuilder<CleanDictionaryViewModel> builder})
      : super(builder: builder, provider: dictionaryUseCaseProvider);

  @override
  CleanDictionaryViewModel createViewModel(
      CleanDictionaryUseCase useCase, CleanDictionaryUIOutput output) {
    return CleanDictionaryViewModel(
        userInputWord: (word) {
          useCase.onWordChanged(word);
        }, meanings: output.wordMeanings, examples: output.wordExamples);
  }

  @override
  void onLayoutReady(context, useCase) {
    useCase.onDictionaryLoad();
  }

  @override
  void onOutputUpdate(context, output){
    output.wordMeanings;

  }
}
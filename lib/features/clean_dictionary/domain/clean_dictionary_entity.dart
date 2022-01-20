import 'package:clean_framework/clean_framework_providers.dart';

class CleanDictionaryEntity extends Entity {
  final String inputWord;
  final List<String> wordMeanings;
  final List<String> wordExamples;

  CleanDictionaryEntity(
      {this.inputWord = "",
      this.wordMeanings = const [],
      this.wordExamples = const []});

  @override
  List<Object?> get props => [wordMeanings, wordExamples];

  CleanDictionaryEntity merge(
          {List<String>? wordMeanings, List<String>? wordExamples}) =>
      CleanDictionaryEntity(
          wordMeanings: wordMeanings ?? this.wordMeanings,
          wordExamples: wordExamples ?? this.wordExamples);
}

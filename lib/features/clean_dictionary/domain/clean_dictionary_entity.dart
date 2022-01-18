import 'package:clean_framework/clean_framework_providers.dart';

class CleanDictionaryEntity extends Entity{

  final String inputWord;
  final List<String> wordMeanings;

  CleanDictionaryEntity({this.inputWord = "", this.wordMeanings = const []});



  @override
  List<Object?> get props => [wordMeanings];

  CleanDictionaryEntity merge({List<String>? wordMeanings}) => CleanDictionaryEntity(wordMeanings: wordMeanings?? this.wordMeanings);

}
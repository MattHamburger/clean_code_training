import 'package:clean_framework/clean_framework_providers.dart';

class CleanDictionaryEntity extends Entity{

  final String inputWord;
  final List<String> wordMeanings;

  CleanDictionaryEntity({this.inputWord = "", this.wordMeanings = const ["make a systematic list of (items of the same type)", "a complete list of items, typically one in alphabetical or other systematic order"]});



  @override
  List<Object?> get props => [wordMeanings];

}
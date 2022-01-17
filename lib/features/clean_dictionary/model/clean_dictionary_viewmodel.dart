import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class CleanDictionaryViewModel extends ViewModel{

  final ValueChanged<String> userInputWord;
  final List<String> meanings;


  CleanDictionaryViewModel({required this.userInputWord, required this.meanings});

  @override
  List<Object?> get props => [meanings];

}
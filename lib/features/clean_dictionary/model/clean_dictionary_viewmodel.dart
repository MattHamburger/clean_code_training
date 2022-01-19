import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class CleanDictionaryViewModel extends ViewModel{

  final ValueChanged<String> userInputWord;
  final List<String> meanings;
  final List<String> examples;


  CleanDictionaryViewModel({required this.userInputWord, required this.meanings, required this.examples});

  @override
  List<Object?> get props => [meanings, examples];

}
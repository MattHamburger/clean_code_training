import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class DictionaryViewModel extends ViewModel{


  final String userInputWord;
  final ValueChanged<String> meaning;

  DictionaryViewModel(this.userInputWord, this.meaning);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
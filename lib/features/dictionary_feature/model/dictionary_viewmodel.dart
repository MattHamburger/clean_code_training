import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class DictionaryViewModel extends ViewModel{

  final ValueChanged<String> userInputWord;


  DictionaryViewModel({required this.userInputWord});

  @override
  // TODO: implement props
  List<Object?> get props => [userInputWord];

}
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/cupertino.dart';

class CleanDictionaryViewModel extends ViewModel{

  final ValueChanged<bool> phonetics;
  final ValueChanged<bool> origin;
  final List<String> meanings;
  final List<String> examples;


  CleanDictionaryViewModel({ required this.phonetics, required this.origin, required this.meanings, required this.examples});

  @override
  List<Object?> get props => [meanings, examples];

}
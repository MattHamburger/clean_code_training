
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class AgeViewModel extends ViewModel{
  final ValueChanged<String> name;

  AgeViewModel(this.name, this.age);

  final String age;


  @override
  List<Object?> get props => [];

}
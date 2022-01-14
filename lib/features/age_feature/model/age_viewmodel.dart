
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class AgeViewModel extends ViewModel{
  final ValueChanged<String> name;
  final String age;
  AgeViewModel({required this.name, required this.age});

  @override
  List<Object?> get props => [];

}
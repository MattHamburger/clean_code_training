import 'package:clean_code_training/features/dictionary_feature/model/dictionary_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import '../../../providers.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DictionaryUI();
  }
}

class DictionaryUI extends UI<DictionaryViewModel> {
  DictionaryUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DictionaryViewModel viewModel) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Word Meaning'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Enter a word"),
                  onChanged: viewModel.userInputWord,
                ),
              ],
            ),
          ),
        ));
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
      PresenterBuilder<DictionaryViewModel> builder) {
    return DictionaryPresenter(builder: builder);
  }
}

class DictionaryPresenter
    extends Presenter<DictionaryViewModel, Output, UseCase> {
  DictionaryPresenter({required PresenterBuilder<DictionaryViewModel> builder})
      : super(builder: builder, provider: dictionaryUseCaseProvider);

  @override
  DictionaryViewModel createViewModel(UseCase<Entity> useCase, Output output) {
    return DictionaryViewModel(userInputWord: (word) {});
  }

  @override
  subscribe(ref) => DummyOutput();


}

class DummyOutput extends Output {
  @override
  List<Object?> get props => [];
}


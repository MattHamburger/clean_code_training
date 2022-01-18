import 'package:clean_code_training/features/clean_dictionary/model/clean_dictionary_viewmodel.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'clean_dictionary_presenter.dart';
import 'clean_dictionary_ui.dart';

class CleanDictionaryWordMeaningsPage extends StatelessWidget {
  const CleanDictionaryWordMeaningsPage({Key? key}) : super(key: key);

  Presenter create(builder) => CleanDictionaryPresenter(builder: builder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CleanDictionaryWordMeaningsUI(),
        appBar: AppBar(title: const Text("Word meaning")));
  }
}

class CleanDictionaryWordMeaningsUI extends UI<CleanDictionaryViewModel> {
  CleanDictionaryWordMeaningsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CleanDictionaryViewModel viewModel) {
    return Center(
      child: ListView.builder(
            itemBuilder: (context, int index) {
              return Material(
                child: ListTile(
                  key: const Key("ListTileKey"),
                  title: Text('Definition ${index+1}: ${viewModel.meanings[index]}'),
                  leading: const Icon(Icons.library_books_sharp),
                  onTap: () => {},
                ),
              );
            },
            shrinkWrap: true,
            itemCount: viewModel.meanings.length,
          ),
    );
  }

  @override
  CleanDictionaryPresenter create(
      PresenterBuilder<CleanDictionaryViewModel> builder) {
    return CleanDictionaryPresenter(builder: builder);
  }
}

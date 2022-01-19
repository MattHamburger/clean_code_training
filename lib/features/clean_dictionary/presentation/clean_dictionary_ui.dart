
import 'package:clean_code_training/features/clean_dictionary/domain/clean_dictionary_usecase.dart';
import 'package:clean_code_training/features/clean_dictionary/model/clean_dictionary_viewmodel.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

import '../../../providers.dart';
import 'clean_dictionary_presenter.dart';



class CleanDictionaryPage extends StatelessWidget {
  const CleanDictionaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CleanDictionaryUI(),
        appBar: AppBar(
          title: const Text('Dictionary Feature'),
        ));
  }
}

class CleanDictionaryUI extends UI<CleanDictionaryViewModel> {
  CleanDictionaryUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CleanDictionaryViewModel viewModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: "Enter a word"),
            ),
            ElevatedButton(
                onPressed: () {
                  router.to(Routes.dictionaryMeanings);
                  viewModel.userInputWord;
                },
                child: const Text("Find meaning"))
          ],
        ),
      ),
    );
  }

  @override
  CleanDictionaryPresenter create(PresenterBuilder<CleanDictionaryViewModel> builder) {
    return CleanDictionaryPresenter(builder: builder);
  }
}



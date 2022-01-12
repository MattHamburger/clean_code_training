import 'package:clean_code_training/features/dictionary_feature/model/dictionary_viewmodel.dart';
import 'package:flutter/material.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Word Meaning'),
        ),
        body: Center(
          child: Column(
            children: const [
              TextField(
                decoration: InputDecoration(labelText: "Enter a word", ),
              ),
            ],
          ),
        ));
  }
}

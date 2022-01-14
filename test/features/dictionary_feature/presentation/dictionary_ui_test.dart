import 'package:clean_code_training/features/dictionary_feature/presentation/dictionary_ui.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setupUITest(context: providersContext, router: router);

  testWidgets('Dictionary Page UI Success', (tester) async{

    await tester.pumpWidget(const MaterialApp(
      home: Text('testing...'),
    ));

    await tester.pumpAndSettle();
    expect(find.byType(Text), findsOneWidget);
    expect(find.text('testing...'), findsOneWidget);
  });

  uiTest('Dictionary UI Unit Test', builder: () => DictionaryUI() ,verify: (tester) async {
  expect(find.text("Word Meaning"), findsOneWidget);
  expect(find.text("Enter a word"), findsOneWidget);
  });

}
import 'package:clean_code_training/features/clean_dictionary/presentation/clean_dictionary_word_meanings_ui.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  setupUITest(context: providersContext, router: router);

  testWidgets('Dictionary Meanings Page UI Success', (tester) async{

    await tester.pumpWidget(const MaterialApp(
      home: Text('testing...testing'),
    ));

    await tester.pumpAndSettle();
    expect(find.byType(Text), findsOneWidget);
    expect(find.text('testing...testing'), findsOneWidget);
  });



  final listFinder = find.byKey(const Key('ListTileKey'));

  uiTest(
    'Dictionary Word Meanings Page UI Unit test',
    builder: () => CleanDictionaryWordMeaningsUI(),
    verify: (tester) async {
      expect(find.byKey(const Key('ListTileKey')), findsNWidgets(2));

      expect(
          find.descendant(
              of: listFinder, matching: find.text("Definition 1: make a systematic list of (items of the same type)")),
          findsOneWidget);
      expect(
          find.descendant(
              of: listFinder, matching: find.text("Definition 2: a complete list of items, typically one in alphabetical or other systematic order")),
          findsOneWidget);
      },
  );


}
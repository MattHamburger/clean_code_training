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
  final switchFinder = find.byKey(const Key('SwitchKey'));
  final dialogFinder1 = find.byKey(const Key("DialogKey 1"));
  final dialogFinder2 = find.byKey(const Key("DialogKey 2"));
  final firstListTileFinder = find.text("Definition 1: make a systematic list of (items of the same type)");
  final secondListTileFinder = find.text("Definition 2: a complete list of items, typically one in alphabetical or other systematic order");
  final dialogText1Finder = find.text("It will be some time before the collection is fully catalogued.");
  final dialogText2Finder = find.text("He also made a catalogue of the manuscripts at Anchin and annotated many of them.");

  uiTest(
    'Dictionary Word Meanings Page UI Unit test',
    builder: () => CleanDictionaryWordMeaningsUI(),
    verify: (tester) async {
      expect(find.byKey(const Key('ListTileKey')), findsNWidgets(2));

      expect(
          find.descendant(
              of: listFinder, matching: firstListTileFinder),
          findsOneWidget);
      expect(
          find.descendant(
              of: listFinder, matching: secondListTileFinder),
          findsOneWidget);
      expect(
          find.descendant(
              of: listFinder, matching: switchFinder),
          findsNWidgets(2));

      await tester.tap(firstListTileFinder, warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(dialogFinder1, findsOneWidget);
      expect(find.descendant(of: dialogFinder1, matching: dialogText1Finder), findsOneWidget);


      // await tester.tap(secondListTileFinder, warnIfMissed: false);
      // await tester.pump();
      // expect(dialogFinder2, findsOneWidget);
      // expect(find.descendant(of: dialogFinder2, matching: dialogText2Finder, skipOffstage: true), findsOneWidget);
      },
  );


}
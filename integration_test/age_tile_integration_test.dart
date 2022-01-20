import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:clean_code_training/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Age Tile integration test', (tester) async {
    app.main();
    final Finder appBarTitle = find.text('Clean Code Training');
    final ageTile = find.byKey(const Key('age_feature_tile'));
    final calculateButton = find.byKey(const Key("calculate_age"));
    final guessGenderButton = find.byKey(const Key("guess_gender"));
    await tester.pumpAndSettle();
    expect(appBarTitle, findsOneWidget);
    expect(ageTile, findsOneWidget);
    await tester.tap(ageTile);
    await tester.pumpAndSettle();
    expect(find.text('Enter Your Name'), findsOneWidget);
    await tester.pumpAndSettle();


    expect(calculateButton, findsOneWidget);
    await tester.tap(calculateButton);
    await tester.pumpAndSettle();
    expect(find.text("Is this the correct age?"), findsOneWidget);
    await tester.pumpAndSettle();
    expect(guessGenderButton, findsOneWidget);
    await tester.tap(guessGenderButton);
    await tester.pumpAndSettle();
    expect(find.text('Your Gender is male'), findsOneWidget);
    await tester.pumpAndSettle();

  });
}

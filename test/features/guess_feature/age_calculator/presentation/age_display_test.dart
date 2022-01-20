
import 'package:clean_code_training/features/guess_feature/age_calculator/presentation/age_display_page.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';

import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupUITest(context: providersContext, router: router);
  testWidgets('Age Display UI success', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Text('run display test'),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Text), findsOneWidget);
    expect(find.text('run display test'), findsOneWidget);
  });

  uiTest(
    'Age display integration test',
    builder: () => AgeDisplayUI(),
    verify: (WidgetTester tester) async {
      expect(find.text('Your age is 50'), findsOneWidget);
      expect(find.text('Is this the correct age?'), findsOneWidget);

      final ageDrop = find.byKey(const Key('age_dropdown'));
      expect(ageDrop, findsOneWidget);

      expect(
          find.descendant(
              of: find.byKey(const Key('age_statement')),
              matching: find.text('correct')),
          findsOneWidget);
      expect(find.text('Guess Gender'), findsOneWidget);

      await tester.tap(ageDrop);
      await tester.pumpAndSettle();
      final ageOption = find.byKey(const Key('incorrect')).last;
      expect(ageOption, findsOneWidget);

      await tester.tap(ageOption);
      await tester.pumpAndSettle();

      //debugDumpApp();
      expect(
          find.descendant(
              of: find.byKey(const Key('age_statement')),
              matching: find.text('incorrect')),
          findsOneWidget);
    },
  );
}

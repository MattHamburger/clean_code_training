
import 'package:clean_code_training/features/age_calculator/presentation/age_calculator_page.dart';

import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';

import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupUITest(context: providersContext, router: router);
  testWidgets('Age Form UI success', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Text('run test'),
      ),
    );


    await tester.pumpAndSettle();

    expect(find.byType(Text), findsOneWidget);
    expect(find.text('run test'), findsOneWidget);

  });

  final listFinder = find.byKey(Key('list'));

  uiTest(
    'Age UI unit test',
    builder: () => AgeCalculatorUI(),
    verify: (WidgetTester tester) async {

      expect(find.text('Enter Your Name'), findsOneWidget);
      expect(find.byKey(const Key('nameInput')), findsOneWidget);

      expect(
          find.descendant(
              of: listFinder, matching: find.text('Enter Your Name')),
          findsOneWidget);

      expect(find.text('Calculate Age'), findsOneWidget);



    },
  );
}

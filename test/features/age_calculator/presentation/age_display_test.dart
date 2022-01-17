import 'package:clean_code_training/features/age_calculator/domain/age_calculator_entity.dart';
import 'package:clean_code_training/features/age_calculator/presentation/age_display_page.dart';
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
    'Age display UI unit test',
    builder: () => AgeDisplayUI(),
    verify: (WidgetTester tester) async {
      expect(find.text('Your age is 50'), findsOneWidget);
    },
  );
}

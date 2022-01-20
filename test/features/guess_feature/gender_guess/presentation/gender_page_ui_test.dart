import 'package:clean_code_training/features/guess_feature/gender_guess/presentation/gender_guess_page.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupUITest(context: providersContext, router: router);
  testWidgets('Gender UI success', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Text('run gender test'),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Text), findsOneWidget);
    expect(find.text('run gender test'), findsOneWidget);
  });
  uiTest(
    'Gender UI unit test',
    builder: () => GenderGuessUI(),
    verify: (WidgetTester tester) async {
      expect(find.text('Your Gender is male'), findsOneWidget);
    },
  );
}

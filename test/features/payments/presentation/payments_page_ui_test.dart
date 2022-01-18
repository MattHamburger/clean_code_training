import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setupUITest(context: providersContext, router: router);
  testWidgets('Payments Form UI success', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Text('test'),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(Text), findsOneWidget);
    expect(find.text('test'), findsOneWidget);
  });

  uiTest(
    'Payments Form integration test',
    builder: () => PaymentsUI(),
    verify: (tester) async {
      await tester.pumpAndSettle();

      expect(find.text('Account Number'), findsOneWidget);
      final drop = find.byKey(const Key('accounts_dropdown'));
      expect(drop, findsOneWidget);

      expect(
          find.descendant(
              of: find.byKey(const Key('selection')),
              matching: find.text('12345')),
          findsOneWidget);

      await tester.tap(drop);
      await tester.pumpAndSettle();

      final creditCardOption = find.byKey(const Key('09876')).last;
      expect(creditCardOption, findsOneWidget);

      await tester.tap(creditCardOption);
      await tester.pumpAndSettle();

      //debugDumpApp();
      expect(
          find.descendant(
              of: find.byKey(const Key('selection')),
              matching: find.text('09876')),
          findsOneWidget);
    },
  );
}

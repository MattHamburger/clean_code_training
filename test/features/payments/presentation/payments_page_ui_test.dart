import 'package:clean_code_training/features/payments/presentation/payments_page.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework.dart';
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
    'AddMachineUI unit test',
    builder: () => PaymentsUI(),
    verify: (tester) async {
      expect(find.text('Account Number'), findsOneWidget);
    },
  );
}

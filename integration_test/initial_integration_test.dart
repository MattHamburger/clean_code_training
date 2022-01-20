import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:clean_code_training/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('App init', (tester) async {
    app.main();
    final Finder appBarTitle = find.text('Clean Code Training');
    final paymentsTile = find.byKey(const Key('payments_feature_tile'));
    await tester.pumpAndSettle();
    expect(appBarTitle, findsOneWidget);expect(paymentsTile, findsOneWidget);
    await tester.tap(paymentsTile);
    await tester.pumpAndSettle();
    expect(find.text('Account Number'), findsOneWidget);
    await tester.pumpAndSettle();
  });

}

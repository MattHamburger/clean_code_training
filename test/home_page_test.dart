
import 'package:clean_code_training/features/guess_feature/age_calculator/presentation/age_calculator_page.dart';
import 'package:clean_code_training/home_page.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_code_training/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(() {
    router.reset();
  });

  group('HomePage tests | ', () {
    testWidgets(
      'correct UI',
          (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final appBarFinder = find.byType(AppBar);
        expect(
          find.descendant(
            of: appBarFinder,
            matching: find.text('Clean Code Training'),
          ),
          findsOneWidget,
        );

        final listTileFinder = find.byType(ListTile);
        expect(listTileFinder, findsNWidgets(3));

        expect(
          find.descendant(
            of: listTileFinder.at(0),
            matching: find.text('Age Feature'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: listTileFinder.at(1),
            matching: find.text('Dictionary feature'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: listTileFinder.at(2),
            matching: find.text('Payments feature'),
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'tap on age tile should redirect to AgePage',
          (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final ageTileFinder = find.text('Age Feature');
        expect(ageTileFinder, findsOneWidget);

        await tester.tap(ageTileFinder);
        await tester.pumpAndSettle();

        expect(find.byType(AgeCalculatorPage), findsOneWidget);
      },
    );


    testWidgets(
      'tap on dictionary tile should redirect to DictionaryPage',
          (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final dictionaryTileFinder = find.text('Dictionary Feature');
        expect(dictionaryTileFinder, findsOneWidget);

        await tester.tap(dictionaryTileFinder);
        await tester.pumpAndSettle();

        expect(find.byType(AgeCalculatorPage), findsOneWidget);
      },
    );
    testWidgets(
      'tap on payments tile should redirect to PaymentsPage',
          (tester) async {
        await tester.pumpWidget(buildWidget(const HomePage()));

        final paymentsTileFinder = find.text('Payments Feature');
        expect(paymentsTileFinder, findsOneWidget);

        await tester.tap(paymentsTileFinder);
        await tester.pumpAndSettle();

        expect(find.byType(AgeCalculatorPage), findsOneWidget);
      },
    );

  });

}

Widget buildWidget(Widget widget) {
  return AppProvidersContainer(
    providersContext: providersContext,
    onBuild: (_, __) {},
    child: MaterialApp.router(
      routeInformationParser: router.informationParser,
      routerDelegate: router.delegate,
    ),
  );
}


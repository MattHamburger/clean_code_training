import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_ui.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Listing Page Tests', () {
    uiTest('My widget has an image, title, name, species, gender and status',
        context: providersContext,
        builder: () => RickMortyUI(),
        verify: (tester) async {
          await tester.pumpAndSettle();

          final textFinder = find.byType(Text);
          expect(textFinder, findsNWidgets(5));

          final imageFinder = find.byType(Image);
          expect(imageFinder, findsNWidgets(1));

          final titleFinder = find.text('Rick And Morty Characters');
          final nameFinder = find.text('Rick Sanchez');
          final speciesFinder = find.text('Human');
          final genderFinder = find.text('Male');
          final statusFinder = find.text('Alive');

          expect(titleFinder, findsOneWidget);
          expect(nameFinder, findsOneWidget);
          expect(speciesFinder, findsOneWidget);
          expect(genderFinder, findsOneWidget);
          expect(statusFinder, findsOneWidget);
        });
  });
}

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:clean_code_training/features/weather/presentation/weather_ui.dart';
import 'package:clean_code_training/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final gateway = weatherGatewayProvider.getGateway(providersContext);

  gateway.transport = (request) async {
    // cityName: json['getCityByName']['name'] ?? '',
    // currentTemp: json['getCityByName']['weather']['temperature']['feelsLike'] ?? 0,
    return Right(
      GraphQLSuccessResponse(
        data: const {
          'getCityByName': {
            'name': 'San Jose',
            'weather': {
              'temperature': {
                'feelsLike': 190,
              }
            }
          },
        },
      ),
    );
  };

  group('WeatherUI tests :: ', () {
    uiTest(
      'lists countries for default continent',
      context: providersContext,
      builder: () => WeatherUI(),
      verify: (tester) async {
        await tester.pumpAndSettle();

        final listTileFinder = find.byType(ListTile);

        expect(listTileFinder, findsNWidgets(2));

        final nepalTileFinder = listTileFinder.first;
        final japanTileFinder = listTileFinder.last;

        expect(
          find.descendant(of: nepalTileFinder, matching: find.text('Nepal')),
          findsOneWidget,
        );
        expect(
          find.descendant(of: nepalTileFinder, matching: find.text('🇳🇵')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: nepalTileFinder,
            matching: find.text('Kathmandu'),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(of: japanTileFinder, matching: find.text('Japan')),
          findsOneWidget,
        );
        expect(
          find.descendant(of: japanTileFinder, matching: find.text('🇯🇵')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: japanTileFinder,
            matching: find.text('Tokyo'),
          ),
          findsOneWidget,
        );
      },
    );

    uiTest(
      'switching continent shows countries for the switched continent',
      context: providersContext,
      builder: () => WeatherUI(),
      verify: (tester) async {
        await tester.pumpAndSettle();

        final listTileFinder = find.byType(ListTile);
        expect(listTileFinder, findsNWidgets(2));

        final continentDropdownFinder = find.byType(
          type<DropdownButton<String>>(),
        );
        expect(continentDropdownFinder, findsOneWidget);

        await tester.tap(continentDropdownFinder);
        await tester.pumpAndSettle();

        final northAmericaOptionFinder = find.text('North America');
        expect(northAmericaOptionFinder, findsNWidgets(2));

        await tester.tap(northAmericaOptionFinder.last);
        await tester.pumpAndSettle();

        expect(listTileFinder, findsOneWidget);

        expect(
          find.descendant(
              of: listTileFinder, matching: find.text('United States')),
          findsOneWidget,
        );
        expect(
          find.descendant(of: listTileFinder, matching: find.text('🇺🇸')),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: listTileFinder,
            matching: find.text('Washington'),
          ),
          findsOneWidget,
        );
      },
    );
  });
}

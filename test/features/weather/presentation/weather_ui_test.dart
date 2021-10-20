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
        data: {
          'getCityByName': {
            'name': request.cityName,
            'weather': const {
              'temperature': {
                'feelsLike': 190.56,
              }
            }
          },
        },
      ),
    );
  };

  group('WeatherUI tests :: ', () {
    // uiTest(
    //   'lists countries for default continent',
    //   context: providersContext,
    //   builder: () => WeatherUI(),
    //   verify: (tester) async {
    //     await tester.pumpAndSettle();
    //
    //     final weatherCardFinder = find.byType(WeatherCard);
    //
    //     expect(weatherCardFinder, findsNWidgets(1));
    //
    //     expect(
    //       find.descendant(
    //           of: weatherCardFinder, matching: find.text('San Jose')),
    //       findsOneWidget,
    //     );
    //     expect(
    //       find.descendant(of: weatherCardFinder, matching: find.text('190')),
    //       findsOneWidget,
    //     );
    //   },
    // );

    uiTest(
      'search for new weather',
      context: providersContext,
      builder: () => WeatherUI(),
      verify: (tester) async {
        await tester.pumpAndSettle();

        final searchTextFieldFinder = find.byType(TextField);
        expect(searchTextFieldFinder, findsOneWidget);

        await tester.enterText(searchTextFieldFinder, 'New York');
        await tester.pumpAndSettle();

        final searchIconButtonFinder = find.byType(IconButton);
        expect(searchIconButtonFinder, findsOneWidget);

        await tester.tap(searchIconButtonFinder);
        await tester.pumpAndSettle();

        final weatherCardFinder = find.byType(WeatherCard);
        expect(weatherCardFinder, findsOneWidget);

        expect(
          find.descendant(of: weatherCardFinder, matching: find.text('190.56')),
          findsWidgets,
        );

        expect(
          find.descendant(
              of: weatherCardFinder, matching: find.text('New York')),
          findsOneWidget,
        );
      },
    );
  });
}

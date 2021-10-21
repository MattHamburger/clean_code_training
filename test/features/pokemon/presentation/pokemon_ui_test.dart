import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_view_model.dart';
import 'package:clean_code_training/features/pokemon/presentation/pokemon_presenter.dart';
import 'package:clean_code_training/features/pokemon/presentation/pokemon_ui.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('PokemonUI Initial Load', (tester) async {
    await ProviderTester().pumpWidget(
      tester,
      MaterialApp(
        home: PokemonUI(
          create: (builder) => PresenterFake(builder: builder),
        ),
      ),
    );

    //debugDumpApp();

    expect(find.text('Full Date'), findsOneWidget);
    expect(find.text('December 31, 2000'), findsOneWidget);
  });
}

class PresenterFake extends PokemonPresenter {
  PresenterFake({required PresenterBuilder<PokemonViewModel> builder})
      : super(builder: builder);

  @override
  PokemonUIOutput subscribe(_) => PokemonUIOutput();
}
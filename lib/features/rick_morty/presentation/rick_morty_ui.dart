import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_presenter.dart';
import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_view_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class RickMortyUI extends UI<RickMortyViewModel> {

  RickMortyUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(PresenterBuilder<RickMortyViewModel> builder) {
    return RickMortyPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, RickMortyViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rick And Morty Characters')),
      body: _CharacterListWidget(isLoading: viewModel.isLoading,
        child: RefreshIndicator(onRefresh: () async {},
          child: ListView.builder(itemCount: viewModel.characters.length, itemBuilder: (context, index) {
            return CharacterCardWidget(characterImage: 'assets/rickandmorty.jpeg', characterName: viewModel.characters[index].name, 
            characterSpecies: viewModel.characters[index].species, characterGender: viewModel.characters[index].gender, 
            characterStatus: viewModel.characters[index].status);
    }))));
  }
}


class _CharacterListWidget extends StatelessWidget {
  
  const _CharacterListWidget(
      {Key? key, required this.isLoading, required this.child})
      : super(key: key);
  
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(duration: const Duration(milliseconds: 300),
      child: (isLoading)
        ? const Center(
            child: SizedBox(width: 20.0, height: 20.0,
              child: CircularProgressIndicator(strokeWidth: 5.0)))
        : child);
  }
}

class CharacterCardWidget extends StatelessWidget {

  const CharacterCardWidget(
    {Key? key,
    required this.characterImage,
    required this.characterName,
    required this.characterSpecies,
    required this.characterGender,
    required this.characterStatus}) : super(key: key);

  final String characterImage;
  final String characterName;
  final String characterSpecies;
  final String characterGender;
  final String characterStatus;

  Text getStatusText(String status) {
    switch (status) {
      case 'unknown':
        return const Text('Unknown', style: TextStyle(fontSize: 14.0, color: Colors.grey));
      case 'Dead':
        return const Text('Dead', style: TextStyle(fontSize: 14.0, color: Colors.red));
      case 'Alive':
        return const Text('Alive', style: TextStyle(fontSize: 14.0, color: Colors.green));
      default:
        return const Text('Unknown', style: TextStyle(fontSize: 14.0, color: Colors.grey));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0), padding: const EdgeInsets.all(8.0), decoration: BoxDecoration(border: Border.all(color: Colors.blueGrey),
    borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(40.0),
            child: Image.asset(characterImage, height: 80.0, width: 80.0, fit: BoxFit.cover)),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(characterName, style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4.0),
                Text(characterSpecies, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0),
                Text(characterGender, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500))
          ])),
          getStatusText(characterStatus)
    ]));
  }
}

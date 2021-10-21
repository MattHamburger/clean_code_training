import 'package:clean_code_training/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Code Training'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.filter_4),
            title: const Text('Rick And Morty'),
            onTap: () => context.push(Routes.rickAndMorty),
          ),
          const Divider()
        ],
      ),
    );
  }
}

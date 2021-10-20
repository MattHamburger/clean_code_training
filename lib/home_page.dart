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
          ListTile(
            leading: const Icon(Icons.filter_1),
            title: const Text('Weather App'),
            onTap: () => context.push(Routes.weather),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.filter_2),
            title: const Text('Feature Two'),
            onTap: () => context.push(Routes.two),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.filter_3),
            title: const Text('Feature Three'),
            onTap: () => context.push(Routes.three),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.filter_4),
            title: const Text('Feature Four'),
            onTap: () => context.push(Routes.four),
          ),
        ],
      ),
    );
  }
}

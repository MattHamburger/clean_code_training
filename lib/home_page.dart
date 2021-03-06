import 'package:clean_code_training/routes.dart';
import 'package:flutter/material.dart';

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
            key: const Key('age_feature_tile'),
            leading: const Icon(Icons.filter_1),
            title: const Text('Age feature'),
            onTap: () => router.to(Routes.ageCalculator),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.filter_1),
            title: const Text('Dictionary feature'),
            onTap: () => router.to(Routes.dictionary),
          ),
          const Divider(),
          ListTile(
            key: const Key('payments_feature_tile'),
            leading: const Icon(Icons.filter_1),
            title: const Text('Payments feature'),
            onTap: () => router.to(Routes.payment),
          ),
        ],
      ),
    );
  }
}

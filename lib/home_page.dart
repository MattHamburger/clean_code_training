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
            leading: const Icon(Icons.filter_1),
            title: const Text('Payment feature'),
            onTap: () => router.to(Routes.payments),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

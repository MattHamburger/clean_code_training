import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: const Center(
        child: Text("Payments UI"),
      ),
    );
  }
}

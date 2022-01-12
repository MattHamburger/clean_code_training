
import 'package:flutter/material.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
        [
          const Text('Enter Your Name'),

          const TextField(
            // onChanged: viewModel.name,
          ),

      ElevatedButton( onPressed: () {  },
      child: const Text("calculate age"))
        ],
      ),
    );
  }
}
//
// class AgeUI extends UI<AgeViewModel> {
//
//
//   @override
//   Widget build(BuildContext context, viewModel) {
//     return Scaffold(
//       body: Column(
//         children: const [
//           Text('Enter Your Name'),
//           TextField(
//             // onChanged: viewModel.name,
//           ),
//         ],
//       ),
//     );
//   }
//
//   // @override
//   // Presenter<ViewModel, Output, UseCase<Entity>> create(PresenterBuilder<AgeViewModel> builder) {
//   //   // TODO: implement create
//   //   throw UnimplementedError();
//   }


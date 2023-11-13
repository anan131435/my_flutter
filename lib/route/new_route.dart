import 'package:flutter/material.dart';
class NewRoute extends StatelessWidget {
  const NewRoute({super.key});
  // final String title;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    if (args is Map<dynamic,dynamic>) {
      print(args["name"]);
    }
    print('get args is $args');
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewRoute'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("this is a new route"),
      ),
    );
  }
}

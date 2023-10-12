import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';

class ChangeNotifierProviderDemo extends StatelessWidget {
  const ChangeNotifierProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifierProviderDemo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<Person>(builder: (context, value, child) {
              return Text(value.name,style: const TextStyle(fontSize: 50));
            },),
            Consumer<Person>(builder: (context, person, child) {
              return ElevatedButton(
                  onPressed: () {
                    person.changeName("林俊杰");
                  },
                  child: const Text("修改名字")
              );
            },)
          ],
        ),
      ),
    );
  }
}

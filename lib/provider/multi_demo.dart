import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';

class MultiProviderDemo extends StatelessWidget {
  const MultiProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<Person1>(
              builder: (context, value, child) {
                return Text(value.name);
              },
            ),
            Consumer<Person2>(builder: (context, value, child) => Text(value.name)),
            Consumer<Person1>(builder: (context, value, child) {
              return ElevatedButton(
                  onPressed: () {
                    value.changeName();
                  },
                  child: const Text("changePerson1")
              );
            },
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}

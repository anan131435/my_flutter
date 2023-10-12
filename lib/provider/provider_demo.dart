import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提供者"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<Person>(
              builder: (context, value, child) {
                return Text(value.name);
              },
            ),

          ],
        ),
      ),
    );
  }
}

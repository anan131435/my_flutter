import 'package:flutter/material.dart';
import 'package:flutter_tips/provider/person.dart';
import 'package:provider/provider.dart';
class ProxyProviderWidget extends StatelessWidget {
  const ProxyProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<Person>(
              builder: (context, value, child) => ElevatedButton(onPressed: () => value.changeName("林俊宇"), child:  const Text("点击修改")),
            ),
            Consumer<EatModel>(builder: (context, value, child) => Text(value.whoEat))
          ],
        ),
      ),
    );
  }
}

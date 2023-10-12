import 'package:flutter/material.dart';
class FooWidget extends StatelessWidget {
  final int count;
  //类型 void function()
  final void Function() onPress;
  const FooWidget({super.key, required this.count, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.withOpacity(0.8),
        margin: const EdgeInsets.all(8),
        child:  Column(
          children: [
            const FlutterLogo(size: 90),
            Text("$count"),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: onPress,
                child: const Text("+2"))
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';
class StreamDemo extends StatelessWidget {
  const StreamDemo({super.key});
  Stream<int> counter() {
    return Stream.periodic(const Duration(milliseconds: 1000),(i) {
      return i;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StreamDemo"),
      ),
      body: StreamBuilder(
        stream: counter(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text("${snapshot.data}");
          } else {
            return Container(
              alignment: Alignment.center,
              child: const Icon(Icons.error),
            );
          }
        },
      ),
    );
  }
}

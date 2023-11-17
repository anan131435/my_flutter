import 'package:flutter/material.dart';
class OpacityPage extends StatefulWidget {
  const OpacityPage({super.key});

  @override
  State<OpacityPage> createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OpacityPage"),
      ),
      body: AnimatedPadding(
        padding: const EdgeInsets.all(0.0),
        curve: Curves.bounceOut,
        duration: const Duration(seconds: 1),
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
      ),
      // body: AnimatedOpacity(
      //   duration: const Duration(seconds: 1),
      //   opacity: 0.5,
      //   child: Container(
      //     width: 300,
      //     height: 300,
      //     color: Colors.blue,
      //   ),
      // ),
    );
  }
}

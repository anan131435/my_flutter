import 'package:flutter/material.dart';
class StateOnePage extends StatefulWidget {
  const StateOnePage({Key? key}) : super(key: key);

  @override
  State<StateOnePage> createState() => _StateOnePageState();
}

class _StateOnePageState extends State<StateOnePage> {
  int _count = 0;
  void _increaseCounter() {
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateOne"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("you have push many times0"),
            Text("$_count",
            style: const TextStyle(fontSize: 45),
            ),
            const Foo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Foo extends StatelessWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(size: 60,);
  }
}


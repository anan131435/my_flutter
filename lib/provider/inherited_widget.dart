import 'package:flutter/material.dart';

class InheritedPage extends StatefulWidget {
  const InheritedPage({super.key});

  @override
  State<InheritedPage> createState() => _InheritedPageState();
}

class _InheritedPageState extends State<InheritedPage> {
  Color _color = Colors.black;
  void _changeColor() {
    // setState
    // _color = Colors.pink;
    setState(() {
      _color = Colors.greenAccent;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MyColor(
      color: _color,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Inherited"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              Text("text show"),
              Foo(),
              Text("next show"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeColor,
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}

class Foo extends StatelessWidget {
  const Foo({super.key});

  @override
  Widget build(BuildContext context) {
    print("build Foo");
    final myColor = context.dependOnInheritedWidgetOfExactType<MyColor>();
    return Container(
      width: 100,
      height: 100,
      color: myColor?.color,
    );
  }
}

class MyColor extends InheritedWidget {
  final Color color;
  const MyColor({super.key, required super.child, required this.color});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("updateShouldNotify");
    return true;
  }
}

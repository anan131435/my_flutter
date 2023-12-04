import 'package:flutter/material.dart';
class MyInheritedWidget extends StatefulWidget {
  const MyInheritedWidget({super.key});

  @override
  State<MyInheritedWidget> createState() => _MyInheritedWidgetState();
}

class _MyInheritedWidgetState extends State<MyInheritedWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("继承式组件"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Text("First Widget"),
             ColorWidget(),
          ],
        ),
      ),
    );
  }
}

class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.dependOnInheritedWidgetOfExactType<ColorInherited>()?.color;
    print("build(BuildContext context)");
    return Container(
      width: 300,
      height: 300,
      color: color,
    );
  }
}

class ColorInherited extends InheritedWidget {
  final Color color;
   const ColorInherited({super.key, required super.child, required this.color});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("updateShouldNotify");
    return false;
  }

}


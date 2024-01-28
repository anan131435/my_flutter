import 'package:flutter/material.dart';
class ScaleAnimationPage extends StatefulWidget {
  const ScaleAnimationPage({super.key});

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> with SingleTickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
        vsync: this
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    animation = Tween(begin: 90.0, end: 300.0).animate(animation)
    ..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Widget build(BuildContext context)");
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScaleAnimationPage"),
      ),
      body: Center(
        child: AnimatedBuilder(
          builder: (context, child) {
            return Icon(
              Icons.phone,
              color: Colors.red,
              size: animation.value,
            );
          },
          animation: animation,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.forward();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

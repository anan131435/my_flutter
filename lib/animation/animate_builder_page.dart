import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacity;
  late Animation _heightAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.repeat(reverse: true);
    _opacity = Tween(begin: 0.5, end: 1.0).animate(_controller);
    _heightAnimation = Tween<double>(begin: 200, end: 300)
        .chain(CurveTween(curve: const Interval(0.5, 1.0)))
        .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("_AnimatedBuilderPageState"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _opacity.value,
          builder: (context, child) {
            return Opacity(
              opacity: _controller.value,
              child: Container(
                  width: 300,
                  height: _heightAnimation.value,
                  // height: 200 + 100 * _controller.value,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: child),
            );
          },
          child: const Text(
            "周杰伦",
            style: TextStyle(fontSize: 70),
          ),
        ),
      ),
    );
  }
}

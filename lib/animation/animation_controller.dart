import 'package:flutter/material.dart';

class ShowAnimated extends StatefulWidget {
  const ShowAnimated({Key? key}) : super(key: key);

  @override
  State<ShowAnimated> createState() => _ShowAnimatedState();
}

class _ShowAnimatedState extends State<ShowAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Widget setupController() {
    return Center(
        child: SlideTransition(
      position: Tween(begin: const Offset(0, 0), end: const Offset(0, 1))
          .chain(CurveTween(curve: Curves.bounceInOut))
          .animate(_controller),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.primaries[0],
      ),
    ));
  }

  @override
  void initState() {
    // AnimationController 就是一系列的double值 [0.0 0.1 0.2 0 .3]
    // Controller.drive(Tween(begin:,end:))
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.0,
      upperBound: 1.0,
      vsync: this,
    )..addListener(() {
        print(_controller.value);
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("显示动画"),
        centerTitle: true,
      ),
      body: Center(
        child: ScaleTransition(
          scale: _controller,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
        // child: RotationTransition(
        //   turns: _controller,
        //   child: Container(
        //     width: 300,
        //     height: 300,
        //     color: Colors.blue,
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _controller.forward();
          // _controller.repeat(reverse: true);
          // _controller.stop();
          _controller.reset();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

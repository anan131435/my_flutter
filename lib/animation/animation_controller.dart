import 'package:flutter/material.dart';

class ShowAnimated extends StatefulWidget {
  const ShowAnimated({Key? key}) : super(key: key);

  @override
  State<ShowAnimated> createState() => _ShowAnimatedState();
}

class _ShowAnimatedState extends State<ShowAnimated> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    // AnimationController 就是一系列的double值 [0.0 0.1 0.2 0 .3]
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
    ..addListener(() {
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
        onPressed: (){
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

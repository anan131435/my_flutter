import 'package:flutter/material.dart';

class TweenPage extends StatelessWidget {
  const TweenPage({super.key});
  //补间动画 Tween 动画变量 + Transform.
  Widget _tweenAnimationBuilder() {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin:0,end: 10.0),
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Text("data",style: TextStyle(fontSize: value),);
      },
    );
  }
  Widget getScale() {
    return Transform.scale(
      scale: 1.2,
      child: Container(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween"),
        centerTitle: true,
      ),
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          duration: const Duration(milliseconds: 1000),
          tween: Tween<Offset>(begin: const Offset(0,0),end: const Offset(200,0)),
          builder: (context, value, child) {
            return Transform.translate(
              offset: value,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Hi",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
* Transform.rotate(
              angle: value,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Hi",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            );
* */

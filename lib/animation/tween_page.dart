import 'package:flutter/material.dart';

class TweenPage extends StatelessWidget {
  const TweenPage({super.key});

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

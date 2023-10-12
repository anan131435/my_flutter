import 'dart:developer';

import 'package:flutter/material.dart';
class AnimationDefaultPage extends StatefulWidget {
  const AnimationDefaultPage({super.key});

  @override
  State<AnimationDefaultPage> createState() => _AnimationDefaultPageState();
}

class _AnimationDefaultPageState extends State<AnimationDefaultPage> {
  double _height = 300.0;
  @override
  Widget build(BuildContext context) {
    log("_AnimationDefaultPageState build");
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: _height,
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: const Text("AnimatedContainer"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _height += 20;
            if (_height >= 400) {
              _height = 300;
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

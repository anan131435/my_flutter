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
      appBar: AppBar(
        title: const Text("AnimationDefaultPage"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: _height,

          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue,
            gradient: const LinearGradient(
              colors: [Colors.orange,Colors.white],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.3,0.5]
            ),
            boxShadow: const [BoxShadow(
              spreadRadius: 10,
              blurRadius: 10,
            )],
            borderRadius: BorderRadius.circular(150),
          ),
          child:  AnimatedSwitcher(
            transitionBuilder: (child, animation) {
              return ScaleTransition(
                scale: animation,
                  child: FadeTransition(opacity: animation,child: child)
              );
              // return RotationTransition(turns: animation,child: child,);
              // return ScaleTransition(scale: animation,child: child,);
            },
            duration:  const Duration(milliseconds: 1000),
            // child: CircularProgressIndicator(key: UniqueKey(),),
            // child: Icon(Icons.add_a_photo_outlined),
            child: Icon(Icons.phone,key: ValueKey("phone")),
          ),
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

import 'package:flutter/material.dart';
import 'package:flutter_tips/animation/animation_default.dart';
import 'package:flutter_tips/sliver/sliver_page.dart';

class AnimationAllPage extends StatelessWidget {
  const AnimationAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("综合页"),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationDefaultPage()));
          },
          child: Container(
           margin: const EdgeInsets.all(8),
           decoration: const BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(8)),
             color: Colors.blueAccent
           ),
            height: 89,
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text("隐士动画"),
          ),
        );
      },
        itemCount: 10,
      ),
    );
  }
}

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
/*
* Animation是一个抽象类，它本身和UI渲染没有关系，他的主要功能是记录动画的状态和插值，
* 常用的Animation类是Animation<double>
通过Animation来监听动画每一帧及其状态的变化
* addListener(),帧监听器
* addStatusListener() 动画状态监听器， 动画开始 结束 正向 反向
* */
import 'package:flutter/material.dart';
import 'package:flutter_tips/animation/animate_builder_page.dart';
import 'package:flutter_tips/animation/animated_counter.dart';
import 'package:flutter_tips/animation/animation_controller.dart';
import 'package:flutter_tips/animation/animation_default.dart';
import 'package:flutter_tips/animation/breathe_animation.dart';
import 'package:flutter_tips/animation/opacity.dart';
import 'package:flutter_tips/animation/scale_animation.dart';
import 'package:flutter_tips/animation/seconds_timer.dart';
import 'package:flutter_tips/animation/tween_page.dart';

class AnimationAllPage extends StatelessWidget {
  AnimationAllPage({super.key});
  final titleList = [
    "隐士动画",
    "缩放动画",
    "不透明度动画",
    "TweenAnimationBuilder",
    "计数器",
    "秒表",
    '显示动画',
    'AnimatedBuilder',
    'BreathAnimation',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("综合页"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationDefaultPage()));
                  print("${index}");
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScaleAnimationPage()));
                  print(index);
                  break;
                case 2:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OpacityPage()));
                  print(index);
                  break;
                case 3:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TweenPage()));
                  print(index);
                  break;
                case 4:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedCounterPage()));
                  break;
                case 5:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondsTimer()));
                  break;
                case 6:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ShowAnimated()));
                  break;
                case 7:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimatedBuilderPage()));
                  break;
                case 8:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const BreatheAnimation()));
                  break;
              }
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration:
                  const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.blueAccent),
              height: 89,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(titleList[index]),
            ),
          );
        },
        itemCount: titleList.length,
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

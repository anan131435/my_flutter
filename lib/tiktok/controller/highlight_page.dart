import 'package:flutter/material.dart';

import 'package:flutter_tips/tiktok/controller/vp_controller.dart';
import 'package:video_player/video_player.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("HeightPage"),
    );
  }

  getData<T>() async {
    Future zyn = Future(() => debugPrint("运行的Future"))
        .then((_) => debugPrint("运行的Future第一个then"))
        .then((_) => debugPrint("运行的Future第二个then"))
    .whenComplete(() => debugPrint("运行的FuturewhenComplete"));
    print(zyn);
  }
}

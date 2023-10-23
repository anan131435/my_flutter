import 'package:flutter/material.dart';
import 'package:flutter_tips/video/control_overlay.dart';
import 'package:video_player/video_player.dart';
class ButterFlyAssetVideo extends StatefulWidget {
  const ButterFlyAssetVideo({super.key});

  @override
  State<ButterFlyAssetVideo> createState() => _ButterFlyAssetVideoState();
}

class _ButterFlyAssetVideoState extends State<ButterFlyAssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset("assets/Butterfly-209.mp4");
    _controller.addListener(() {
      setState(() {

      });
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState((){}));
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
          ),
          const Text("With Asset Mp4"),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  ControlOverlay(controller: _controller),
                  VideoProgressIndicator(_controller,allowScrubbing: true)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

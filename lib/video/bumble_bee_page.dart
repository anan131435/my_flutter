import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tips/video/control_overlay.dart';
import 'package:video_player/video_player.dart';

class BumbleBeeRemoteVideo extends StatefulWidget {
  const BumbleBeeRemoteVideo({super.key});

  @override
  State<BumbleBeeRemoteVideo> createState() => _BumbleBeeRemoteVideoState();
}

class _BumbleBeeRemoteVideoState extends State<BumbleBeeRemoteVideo> {
  late VideoPlayerController _controller;

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context).loadString("assets/bumble_bee_captions.vtt");
    return WebVTTCaptionFile(fileContents);
  }

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
      closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true)
    );
    _controller.initialize();
    _controller.setLooping(true);
    _controller.addListener(() {
      log("_controller.addListener");
      setState(() {

      });
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          const Text("With Remote Mp4"),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  ClosedCaption(text: _controller.value.caption.text),
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

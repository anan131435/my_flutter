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
  late PageController _pageController;
  int currentIndex = 0;
  List<String> videoList = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];
  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context).loadString("assets/bumble_bee_captions.vtt");
    return WebVTTCaptionFile(fileContents);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0,keepPage: true);
    createVideoController(videoList[currentIndex]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(itemBuilder: (context, index) {
        return _playerWidget();
      },
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        controller: _pageController,
        onPageChanged: (value) {
          currentIndex = value;
          createVideoController(videoList[currentIndex]);
          setState(() {

          });
        },
      )
    );
  }
  Widget _playerWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
    );
  }
  void destroyController() {
    _controller.dispose();
  }
  void createVideoController(String url) {
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(url),
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
  }
}

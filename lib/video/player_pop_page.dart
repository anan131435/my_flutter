import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPopPage extends StatefulWidget {
  const VideoPlayerPopPage({super.key});

  @override
  State<VideoPlayerPopPage> createState() => _VideoPlayerPopPageState();
}

class _VideoPlayerPopPageState extends State<VideoPlayerPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startPlaying = false;

  @override
  void initState() {
    log("_VideoPlayerPopPageState initState");
    _videoPlayerController = VideoPlayerController.asset("assets/Butterfly-209.mp4");
    _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(() {
      log("_videoPlayerController.addListener");
      if (startPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startPlaying = true;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    log("_VideoPlayerPopPageState build");
    return Material(
      child: Center(
        child: FutureBuilder(
          future: started(),
          builder: (context, snapshot) {
            log("FutureBuilder build");
            if (snapshot.data ?? false) {
              return AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const Text("waiting for video to load");
            }
          },
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // https://cachem3u8.2s0.cn:8899/VideoPlay.php?r=f586f108e753b6f5f672f82393c12e72.m3u8
    // "https://s3.bfengbf.com/video/dinvguilai/第01集/index.m3u8"
    //  https://s3.bfengbf.com/video/yijiaoshuaichugepotianfugui/第01集/index.m3u8
    _controller = VideoPlayerController.networkUrl(
        Uri.parse("https://s3.bfengbf.com/video/dinvguilai/第01集/index.m3u8"));
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            log("FutureBuilder build");
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:  Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.red),
      ),
    );
  }
}

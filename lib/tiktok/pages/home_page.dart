import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_tips/tiktok/controller/vp_controller';
import 'package:flutter_tips/tiktok/mock/video.dart';
import 'package:flutter_tips/tiktok/pages/scaffold_controller.dart';
import 'package:flutter_tips/tiktok/views/tiktok_tab_bar.dart';
import 'package:flutter_tips/tiktok/controller/tiktok_video_list_controller.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
  TikTokPageTag tabBarType = TikTokPageTag.home;
  TikTokScaffoldController tkController = TikTokScaffoldController();
  PageController _pageController = PageController();
  TikTokVideoListController _tikTokVideoListController = TikTokVideoListController();

  Map<int,bool> favoriteMap = {};
  List<UserVideo> videoDataList = [];

  @override
  void initState() {
    videoDataList = UserVideo.fetchVideo();
    WidgetsBinding.instance.addObserver(this);
    _tikTokVideoListController.init(
        pageController: _pageController,
        initiaList: videoDataList.map((e) => VPVideoController(videoInfo: e,builder: () => VideoPlayerController.networkUrl(Uri.parse(e.url)))).toList(),
        videoProvider: (index, list) async {
          return videoDataList.map((e) =>
              VPVideoController(builder: () =>
                  VideoPlayerController.networkUrl(Uri.parse(e.url))))
              .toList();
        },
    );
    _tikTokVideoListController.addListener(() {
      setState(() {

      });
    });

    tkController.addListener(() {
      if (tkController.value == TikTokPagePosition.middle) {
        _tikTokVideoListController.currentPlayer.play();
      } else {
        _tikTokVideoListController.currentPlayer.pause();
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

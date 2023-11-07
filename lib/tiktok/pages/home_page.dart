import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_tips/tiktok/controller/vp_controller.dart';
import 'package:flutter_tips/tiktok/mock/video.dart';
import 'package:flutter_tips/tiktok/pages/follow_page.dart';
import 'package:flutter_tips/tiktok/pages/msg_page.dart';
import 'package:flutter_tips/tiktok/pages/scaffold_controller.dart';
import 'package:flutter_tips/tiktok/pages/search_page.dart';
import 'package:flutter_tips/tiktok/pages/user_page.dart';
import 'package:flutter_tips/tiktok/views/tiktok_tab_bar.dart';
import 'package:flutter_tips/tiktok/controller/tiktok_video_list_controller.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  TikTokPageTag tabBarType = TikTokPageTag.home;
  TikTokScaffoldController tkController = TikTokScaffoldController();
  PageController _pageController = PageController();
  TikTokVideoListController _tikTokVideoListController = TikTokVideoListController();

  Map<int, bool> favoriteMap = {};
  List<UserVideo> videoDataList = [];

  @override
  void initState() {
    videoDataList = UserVideo.fetchVideo();
    WidgetsBinding.instance.addObserver(this);
    _tikTokVideoListController.init(
      pageController: _pageController,
      initiaList: videoDataList
          .map(
              (e) => VPVideoController(videoInfo: e, builder: () => VideoPlayerController.networkUrl(Uri.parse(e.url))))
          .toList(),
      videoProvider: (index, list) async {
        return videoDataList
            .map((e) => VPVideoController(builder: () => VideoPlayerController.networkUrl(Uri.parse(e.url))))
            .toList();
      },
    );
    _tikTokVideoListController.addListener(() {
      setState(() {});
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
    Widget? currentPage;
    switch (tabBarType) {
      case TikTokPageTag.home:
        break;
      case TikTokPageTag.follow:
        currentPage = FollowPage();
        break;
      case TikTokPageTag.msg:
        currentPage = MsgPage();
        break;
      case TikTokPageTag.me:
        currentPage = UserPage(isSelfPage: true);
        break;
    }
    double a = MediaQuery.of(context).size.aspectRatio;
    bool hasBottomPadding = a < 0.55;
    bool hasBackground = hasBottomPadding;
    hasBackground = tabBarType != TikTokPageTag.home;
    if (hasBottomPadding) {
      hasBackground = true;
    }
    Widget tiktokTabBar = TiktokTabBar(
      hasBackground: hasBackground,
      current: tabBarType,
      onTabSwitch: (type) {
        setState(() {
          tabBarType = type;
          if (type == TikTokPageTag.home) {
            _tikTokVideoListController.currentPlayer.play();
          } else {
            _tikTokVideoListController.currentPlayer.pause();
          }
        });
      },
      onAddButton: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Container()));
      },
    );
    var userPage = UserPage(
        isSelfPage: false,
        canPop: true,
        onPop: () {
          tkController.animateToMiddle();
        });
    var searchPage = SearchPage(pop: tkController.animateToMiddle);
    var header = Container();
    return Container();
  }
}

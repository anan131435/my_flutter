import 'package:flutter/material.dart';
import 'package:flutter_tips/video/bumble_bee_page.dart';
import 'package:flutter_tips/video/butter_fly_inlist.dart';
import 'package:flutter_tips/video/butterfly_asset_video_page.dart';
import 'package:flutter_tips/video/player_pop_page.dart';

class VideoApp extends StatelessWidget {
  const VideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          key: const ValueKey("home_page"),
          appBar: AppBar(
            title: const Text("Video Player Example"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPlayerPopPage(),
                          settings: const RouteSettings(
                            arguments: {"name": 123}
                          )
                        ),
                    );
                  },
                  icon: const Icon(Icons.navigation))
            ],
            bottom: const TabBar(
                isScrollable: true,
              tabs: [
                Tab(
                  icon: Icon(Icons.cloud),
                  text: "Remote",
                ),
                Tab(
                  icon: Icon(Icons.insert_drive_file),
                  text: "Asset",
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: "List Example",
                )
              ],
            ),
          ),
          body: const TabBarView(
              children: [
                BumbleBeeRemoteVideo(),
                ButterFlyAssetVideo(),
                ButterFlyInList(),
              ]
          ),
        )
    );
  }
}

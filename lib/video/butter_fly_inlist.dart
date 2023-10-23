import 'package:flutter/material.dart';
import 'package:flutter_tips/video/butterfly_asset_video_page.dart';

class ButterFlyInList extends StatelessWidget {
  const ButterFlyInList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FlutterLogo(size: 100),
        const ButterFlyAssetVideo(),
        const ButterFlyAssetVideo(),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        const FlutterLogo(size: 100),
        Card(
          child: Column(
            children: [
              Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.cake),
                    title: Text("Video play"),
                  ),
                  Stack(
                    children: [
                      const ButterFlyAssetVideo(),
                      // Image.asset("assets/flutter-mark-square-64.png"),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const FlutterLogo(),
        const FlutterLogo(),
        const FlutterLogo(),
        const FlutterLogo(),
      ],
    );
  }
}

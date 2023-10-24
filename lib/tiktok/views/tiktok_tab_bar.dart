import 'package:flutter/material.dart';

enum TikTokPageTag {
  home,
  follow,
  msg,
  me
}
class TiktokTabBar extends StatelessWidget {
  const TiktokTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("TiktokTabBar");
  }
}

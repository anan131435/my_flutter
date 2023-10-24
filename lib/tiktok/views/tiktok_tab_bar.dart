import 'package:flutter/material.dart';
import 'package:flutter_tips/tiktok/views/select_text.dart';

enum TikTokPageTag { home, follow, msg, me }

class TiktokTabBar extends StatelessWidget {
  const TiktokTabBar({
    super.key,
    this.onTabSwitch,
    this.onAddButton,
    this.current,
    required this.hasBackground,
  });
  final TikTokPageTag? current;
  final bool hasBackground;
  final Function()? onAddButton;
  final Function(TikTokPageTag)? onTabSwitch;
  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            onTabSwitch?.call(TikTokPageTag.home);
          },
          child: SelectText(
              isSelected: current == TikTokPageTag.home,
            title: "首页",
          ),
        )
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                onTabSwitch?.call(TikTokPageTag.follow);
              },
              child: SelectText(
                isSelected: current == TikTokPageTag.follow,
                title: "关注",
              ),
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                onAddButton?.call();
              },
              child: const Icon(
                Icons.add_box,
                size: 32,
              )
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                onTabSwitch?.call(TikTokPageTag.msg);
              },
              child: SelectText(
                isSelected: current == TikTokPageTag.msg,
                title: "消息",
              ),
            )
        ),
        Expanded(
            child: GestureDetector(
              onTap: () {
                onTabSwitch?.call(TikTokPageTag.me);
              },
              child: SelectText(
                isSelected: current == TikTokPageTag.me,
                title: "我",
              ),
            )
        ),
      ],
    );
    return Container(
      color: hasBackground ? Colors.black : Colors.black.withOpacity(0),
      child: Container(
        padding: EdgeInsets.only(bottom: padding.bottom),
        height: 50 + padding.bottom,
        child: row,
      ),
    );
  }
}

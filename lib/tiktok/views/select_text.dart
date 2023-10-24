import 'package:flutter/material.dart';
import 'package:flutter_tips/tiktok/style/style.dart';

class SelectText extends StatelessWidget {
  const SelectText({super.key, this.isSelected = true, this.title});
  final bool isSelected;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.black.withOpacity(0),
      child: Text(
        title ?? "??",
        textAlign: TextAlign.center,
        style: isSelected ? StandardTextStyle.big : StandardTextStyle.bigWithOpacity,
      ),
    );
  }
}

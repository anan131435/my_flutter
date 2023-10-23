import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class ControlOverlay extends StatelessWidget {
  const ControlOverlay({super.key, required this.controller});
  final VideoPlayerController controller;

  static const List<Duration> _exampleCaptionOffsets = <Duration> [
    Duration(seconds:  -10),
    Duration(seconds:  -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];

  static const List<double> _examplePlaybackRates = [
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying ? const SizedBox.shrink() : Container(
            color: Colors.black12,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          )
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: "Caption Offet",
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (context)  {
              return <PopupMenuItem<Duration>>[
              for(final Duration offsetDuration in _exampleCaptionOffsets)
                PopupMenuItem<Duration>(
                  value: offsetDuration,
                  child: Text('${offsetDuration.inMilliseconds}ms'),
                )
            ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: "Play back speed",
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (context) => <PopupMenuItem<double>>[
              for(final double speed in _examplePlaybackRates)
                PopupMenuItem(
                  value: speed,
                  child: Text('$speed x'),
                )
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        )
      ],
    );
  }
}

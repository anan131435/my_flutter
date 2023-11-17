import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tips/tiktok/controller/vp_controller.dart';
import 'package:flutter_tips/tiktok/mock/video.dart';
import 'package:video_player/video_player.dart';
typedef ControllerSetter<T> = Future<void> Function(T controller);
typedef ControllerBuilder<T> = T Function();
// 异步方法同步锁
Completer<void>? _syncLock;
abstract class TikTokBaseController<T> {
  T? get controller;
  ValueNotifier<bool> get showPauseIcon;
  Future<void> init({ControllerSetter<T>? afterInit});
  Future<void> play();
  Future<void> dispose();
  Future<void> pause({bool showPauseIcon = false});
}
class VPBaseVideoController extends TikTokBaseController<VideoPlayerController> {
  VideoPlayerController? _controller;
  ValueNotifier<bool> _showPauseIcon = ValueNotifier<bool>(false);
  final UserVideo? videoInfo;
  final ControllerSetter<VideoPlayerController>? _afterInit;
  final ControllerBuilder<VideoPlayerController> _builder;
  bool get prepared =>_prepared;
  bool get isDispose => _disposeLock != null;
  Completer<void>? _disposeLock;
  bool _prepared = false;


  VPBaseVideoController(
  {
    this.videoInfo,
    required ControllerBuilder<VideoPlayerController> builder,
    ControllerSetter<VideoPlayerController>? afterInit,
  }) : _builder = builder,
      _afterInit = afterInit;

  @override
  // TODO: implement controller
  VideoPlayerController get controller {
    _controller ??= _builder.call();
    return _controller!;
  }

  @override
  Future<void> dispose() async {
    if (!_prepared) return;
    _prepared = false;
    print('+++dispose ${hashCode}');
    await controller.dispose();
    _controller = null;
    print('+++==dispose ${hashCode}');
    _disposeLock = Completer<void>();
  }

  @override
  Future<void> init({ControllerSetter<VideoPlayerController>? afterInit}) async {
    if (_prepared) return;

    print("++++initialize $hashCode");
    await controller.initialize();
    await controller.setLooping(true);
    afterInit ??= _afterInit;
    await _afterInit!.call(controller);
    print("++++==$hashCode");
    _prepared = true;

    if (_disposeLock != null) {
      _disposeLock!.complete();
      _disposeLock = null;
    }
  }

  @override
  Future<void> pause({bool showPauseIcon = false}) async {
    await init();
    if (!_prepared) return;
    if (_disposeLock != null) {
      await _disposeLock!.future;
    }
    await controller.pause();
    _showPauseIcon.value = true;
  }

  @override
  Future<void> play() async {
    await init();
    if (!_prepared) return;
    if (_disposeLock != null) {
      await _disposeLock!.future;
    }
    await controller.play();
    _showPauseIcon.value = false;
  }

  @override
  // TODO: implement showPauseIcon
  ValueNotifier<bool> get showPauseIcon => _showPauseIcon;

}
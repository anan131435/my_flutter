import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_tips/tiktok/mock/video.dart';
import 'package:video_player/video_player.dart';

typedef ControllerSetter<T> = Future<void> Function(T controller);
typedef ControllerBuilder<T> = T Function();
Completer<void>? _syncLock;

abstract class TikTokVideoController<T> {
  T? get controller;
  ValueNotifier<bool> get showPauseIcon;
  Future<void> init({ControllerSetter<T>? afterInit});
  Future<void> dispose();
  Future<void> play();
  Future<void> pause({bool showPauseIcon = false});
}

class VPVideoController extends TikTokVideoController<VideoPlayerController> {
  VideoPlayerController? _controller;
  ValueNotifier<bool> _showPauseIcon = ValueNotifier<bool>(false);
  final UserVideo? videoInfo;
  final ControllerBuilder<VideoPlayerController> _builder;
  final ControllerSetter<VideoPlayerController>? _afterInit;
  bool _prepared = false;
  Completer<void>? _disposeLock;
  VPVideoController({
    this.videoInfo,
    required ControllerBuilder<VideoPlayerController> builder,
    ControllerSetter<VideoPlayerController>? afterInit,
  })  : _builder = builder,
        _afterInit = afterInit;

  @override
  VideoPlayerController get controller {
    _controller ??= _builder.call();
    return _controller!;
  }

  bool get prepared => _prepared;
  bool get isDispose => _disposeLock != null;

  Future<void> _synCall(Future Function()? fn) async {
    var lastCompleter = _syncLock;
    var completer = Completer<void>();
    _syncLock = completer;
    //等待其他同步任务完成
    await lastCompleter?.future;
    //主任务
    await fn?.call();
    completer.complete();
  }

  @override
  Future<void> dispose() async {
    if (!prepared) return;
    _prepared = false;
    await _synCall(() async {
      log("dispose ${this.hashCode}");
      await controller.dispose();
      _controller = null;
      _disposeLock = Completer<void>();
    });
  }

  @override
  Future<void> init({ControllerSetter<VideoPlayerController>? afterInit}) async {
    if (prepared) return;
    await _synCall(() async {
      log("init ${hashCode}");
      await controller.initialize();
      await controller.setLooping(true);
      afterInit ??= _afterInit;
      await afterInit?.call(controller);
      _prepared = true;
    });
    if (_disposeLock != null) {
      _disposeLock?.complete();
      _disposeLock = null;
    }
  }

  @override
  Future<void> pause({bool showPauseIcon = false}) async {
    await init();
    if (!prepared) return;
    if (_disposeLock != null) {
      await _disposeLock?.future;
    }
    await controller.pause();
    _showPauseIcon.value = true;
  }

  @override
  Future<void> play() async {
    await init();
    if (!prepared) return;
    if (_disposeLock != null) {
      await _disposeLock?.future;
    }
    controller.play();
    _showPauseIcon.value = false;
  }

  @override
  ValueNotifier<bool> get showPauseIcon => _showPauseIcon;
}



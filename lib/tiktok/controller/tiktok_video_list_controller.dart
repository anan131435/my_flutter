import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tips/tiktok/controller/vp_controller';
import 'dart:math';

typedef LoadMoreVideo = Future<List<VPVideoController>> Function(
  int index,
  List<VPVideoController> list,
);

class TikTokVideoListController extends ChangeNotifier {
  // 剩余几个触发预加载 1 最后一个 2 倒数第二个
  final int loadMoreCount;
  //预加载几个视频
  final int preloadCount;
  //超出多少个就释放
  final int disposeCount;
  LoadMoreVideo? _videoProvider;

  ValueNotifier<int> index = ValueNotifier<int>(0);
  List<VPVideoController> playerList = [];
  VPVideoController get currentPlayer => playerList[index.value];
  int get videoCount => playerList.length;

  TikTokVideoListController({
    this.loadMoreCount = 1,
    this.preloadCount = 2,
    this.disposeCount = 1,
  });

  loadIndex(int target, {bool reload = false}) {
    if (!reload) {
      if (index.value == target) return;
    }
    var oldIndex = index.value;
    var newIndex = target;
    //暂停之前的视频
    if (!(oldIndex == 0 && newIndex == 0)) {
      playerOfIndex(oldIndex)?.controller.seekTo(Duration.zero);
      playerOfIndex(oldIndex)?.controller.pause();
      print("暂停$oldIndex");
    }
    //播放当前的视频
    playerOfIndex(newIndex)?.controller.addListener(_didUpdateValue);
    playerOfIndex(newIndex)?.showPauseIcon.addListener(_didUpdateValue);
    playerOfIndex(newIndex)?.play();
    print("播放$newIndex");
    for (var i = 0; i < playerList.length; i++) {
      if (i < newIndex - disposeCount || i > newIndex + max(disposeCount, 2)) {
        playerOfIndex(i)?.controller.removeListener(_didUpdateValue);
        playerOfIndex(i)?.showPauseIcon.removeListener(_didUpdateValue);
        playerOfIndex(i)?.dispose();
        continue;
      }

      if (i > newIndex && i < newIndex + preloadCount) {
        playerOfIndex(i)?.init();
        continue;
      }
    }

    if (playerList.length - newIndex <= loadMoreCount + 1) {
      _videoProvider?.call(newIndex, playerList).then((value) {
        playerList.addAll(value);
        notifyListeners();
      });
    }
    index.value = target;
  }

  _didUpdateValue() {
    notifyListeners();
  }

  VPVideoController? playerOfIndex(int index) {
    if (index < 0 || index > playerList.length - 1) {
      return null;
    }
    return playerList[index];
  }

  init({
    required PageController pageController,
    required List<VPVideoController> initiaList,
    required LoadMoreVideo videoProvider,
  }) async {
    playerList.addAll(initiaList);
    _videoProvider = videoProvider;
    pageController.addListener(() {
      var p = pageController.page!;
      //取余数
      if (p % 1 == 0) {
        //取整
        loadIndex(p ~/ 1);
      }
    });
    loadIndex(0, reload: true);
    notifyListeners();
  }
}

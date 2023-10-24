import 'package:flutter/cupertino.dart';

const double scrollSpeed = 300;
enum TikTokPagePosition {
  left,
  right,
  middle
}
class TikTokScaffoldController extends ValueNotifier<TikTokPagePosition> {
  TikTokScaffoldController([TikTokPagePosition value = TikTokPagePosition.middle,]) :super(value);
  Future Function(TikTokPagePosition pagePosition)? _onAnimateToPage;

  Future? animateToMiddle() {
    return _onAnimateToPage?.call(TikTokPagePosition.middle);
  }

  Future? animateToLeft() {
    return _onAnimateToPage?.call(TikTokPagePosition.left);
  }

  Future? animateToRight() {
    return _onAnimateToPage?.call(TikTokPagePosition.right);
  }

  Future? animateToPage(TikTokPagePosition pagePosition) {
    return _onAnimateToPage?.call(pagePosition);
  }
}
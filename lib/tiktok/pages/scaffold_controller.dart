import 'package:flutter/cupertino.dart';
import 'package:flutter_tips/tiktok/views/tiktok_tab_bar.dart';
import 'dart:math';
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

class TikTokScaffold extends StatefulWidget {
  const TikTokScaffold({
    super.key,
    this.header,
    this.tabbar,
    this.leftPage,
    this.rightPage,
    this.currentIndex = 0,
    this.hasBottomPadding = false,
    this.page,
    this.enableGesture,
    this.onPullDownRefresh,
    this.controller
  });
  final TikTokScaffoldController? controller;
  final Widget? header;
  final Widget? tabbar;
  final Widget? leftPage;
  final Widget? rightPage;
  final int currentIndex;
  final bool hasBottomPadding;
  final bool? enableGesture;
  final Widget? page;
  final Function()? onPullDownRefresh;

  @override
  State<TikTokScaffold> createState() => _TikTokScaffoldState();
}

class _TikTokScaffoldState extends State<TikTokScaffold> with TickerProviderStateMixin {
  AnimationController? animationControllerX;
  AnimationController? animationControllerY;
  late Animation<double> animationX;
  late Animation<double> animationY;
  double offsetX = 0.0;
  double offsetY = 0.0;
  double inMiddle = 0;
  double? screenWidth;

  @override
  void initState() {
    widget.controller!._onAnimateToPage = animationToPage;
    super.initState();
  }

  Future animationToPage(p) async {
    if (screenWidth == null) {
      return null;
    }
    switch (p) {
      case TikTokPageTag.home:
        await animationToPage(p);
    }
  }

  Future animateTo([double end = 0.0]) {
    final curve = curveAnimation();
    animationX = Tween(begin: offsetX,end: end).animate(curve)
      ..addListener(() {
      setState(() {
        offsetX = animationX.value;
      });
    });
    inMiddle = end;
    return animationControllerX!.animateTo(1);
  }

  CurvedAnimation curveAnimation() {
    animationControllerX = AnimationController(
      duration: Duration(milliseconds: max(offsetX.abs(),60) * 1000 ~/ 500),
        vsync: this
    );
    return CurvedAnimation(parent: animationControllerX!, curve: Curves.easeInCubic);
  }

  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }

}

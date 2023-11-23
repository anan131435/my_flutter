import 'package:flutter/material.dart';

class BreatheAnimation extends StatefulWidget {
  const BreatheAnimation({super.key});

  @override
  State<BreatheAnimation> createState() => _BreatheAnimationState();
}

class _BreatheAnimationState extends State<BreatheAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation1;
  late Animation _animation2;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    // _animation1 = Tween<double>(begin: 0, end: 1.0)
    //     .chain(CurveTween(
    //       curve: const Interval(0, 0.2),
    //     ))
    //     .animate(_controller);
    // _animation2 = Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Interval(0.7,1.0))).animate(_controller);
    _controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("478呼吸法"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  gradient: RadialGradient(
                    colors: [Colors.blue[600]!, Colors.blue[100]!],
                    stops: [_controller.value, _controller.value + 0.1],
                  )),
            );
          },
        ),
      ),
    );
  }
}

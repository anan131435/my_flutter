import 'package:flutter/material.dart';

class AnimatedCounterPage extends StatelessWidget {
  const AnimatedCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("计数器"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedCounter(value: 8)
      ),
    );
  }
}


class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter({super.key, required this.value});
  final double fontSize = 100.0;
  final int value;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 1000),
      tween: Tween<double>(end: value.toDouble()),
      builder: (context, value, child) {
        final whole = value ~/ 1;
        final decimals = value - whole;
        print("$whole + $decimals" );
        return Container(
          width: 300,
          height: 100,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                top: - decimals * 100, // 0 - -100
                child: Opacity(
                  opacity: 1 - decimals, // 1 -> 0
                  child: Text(
                    "$whole",
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
              Positioned(
                top: 100 - 100 * decimals,
                child: Opacity(
                  opacity: decimals,
                  child: Text(
                    "${whole + 1}",
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

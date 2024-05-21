import 'package:flutter/material.dart';
class TextPage extends StatelessWidget {
  const TextPage({super.key});

  Widget _textWidget() {
    return Transform.rotate(
      angle: 3.14 * 90 / 180,
      child: Container(
        padding: const EdgeInsets.only(left: 4,top: 4,right: 4,bottom: 4),
        height: 29,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,color: Colors.black12),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Text(
          "confrim",
              style: TextStyle(fontSize: 14,color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("text"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _textWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiThreadPage extends StatefulWidget {
  const MultiThreadPage({super.key});

  @override
  State<MultiThreadPage> createState() => _MultiThreadPageState();
}

class _MultiThreadPageState extends State<MultiThreadPage> {
  double? _pi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "$_pi",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          CircularProgressIndicator(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            _pi = null;
          });
          // final double pi = _estimatePi(1000000000);
          final double pi = await compute(_estimatePi,10000000000);
          setState(() {
            _pi = pi;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}
// compute 创建一个新的isolate并且知道调用全局函数
double _estimatePi(int terms) {
  double pi = 0;
  for(int i = 1; i< terms; i+=4) {
    pi += (4 / i) - (4 / (i + 2));

  }
  return pi;
}

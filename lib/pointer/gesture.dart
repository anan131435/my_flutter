import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class GestureRecognizerPage extends StatefulWidget {
  const GestureRecognizerPage({super.key});

  @override
  State<GestureRecognizerPage> createState() => _GestureRecognizerPageState();
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void initState() {
    _tapGestureRecognizer.onTap = () {
      setState(() {
        _toggle = !_toggle;
      });
    };
    super.initState();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GestureRecognizerPage"),
      ),
      body: Text.rich(
          TextSpan(
        children: [
          const TextSpan(
            text: "Hello world",
          ),
          TextSpan(
            text: "click me change color",
            style: TextStyle(
              color: _toggle ? Colors.red : Colors.blue,
              fontSize: 30
            ),
            recognizer: _tapGestureRecognizer
          ),
          const TextSpan(text: 'zhou jie lun'),
        ]
      )
      ),
    );
  }
}

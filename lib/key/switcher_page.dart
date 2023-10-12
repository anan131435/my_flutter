import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => SwitchPageState();
}

class SwitchPageState extends State<SwitchPage> {
  bool _isActive = false;
  changeState() {
    _isActive = !_isActive;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Switch.adaptive(
        value: _isActive,
        activeColor: Colors.blueAccent,
        onChanged: (value) {
          setState(() {
            _isActive = value;
          });
        },
      ),
    );

  }
}

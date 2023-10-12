import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => SwitchWidgetState();
}

class SwitchWidgetState extends State<SwitchWidget> {
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

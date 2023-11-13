import 'package:flutter/material.dart';

class PointerIndicator extends StatefulWidget {
  const PointerIndicator({super.key});

  @override
  State<PointerIndicator> createState() => _PointerIndicatorState();
}

class _PointerIndicatorState extends State<PointerIndicator> {
  PointerEvent _event = PointerUpEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.brown,
              width: 300,
              height: 300,
              child: Text(
                '${_event.localPosition ?? ""}',
                style: const TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
            AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                onPointerDown: (event) => print("in"),
              ),
            )
          ],
        ),
        onPointerDown: (event) => setState(() {
          print("down");
          _event = event;
        }
        ),
        onPointerMove: (event) => setState(() {
          _event = event;
        }
        ),
        onPointerUp: (event) => setState(() {
          _event = event;
        }
        ),
      ),
    );
  }
}

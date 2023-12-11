import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tips/animation/signature/signature_painter.dart';
class LineWidget extends StatefulWidget {
  const LineWidget({super.key});

  @override
  State<LineWidget> createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  final List<Offset> _points = [];
  final StreamController<List<List<Offset>>> _controller = StreamController<List<List<Offset>>>();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  void _clear() {
    _points.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          child: Container(
            color: Colors.red,
          ),
          onPointerDown: (PointerDownEvent event) {
            //添加起始点
            _points.add(event.localPosition);
            _controller.sink.add([_points]);
          },
          onPointerMove: (PointerMoveEvent event) {
            //添加途经点
            _points.add(event.localPosition);
            _controller.sink.add([_points]);
          },
          onPointerUp: (PointerUpEvent event) {
            //添加结束点
            _points.add(Offset.zero);
          },
        ),
        StreamBuilder<List<List<Offset>>>(
          stream: _controller.stream,
            builder: (context, AsyncSnapshot<List<List<Offset>>> snapshot) {
            print(snapshot.data);
              return snapshot.hasData ? CustomPaint(painter: LinePainter(snapshot.data!)) : const SizedBox();
            },
        ),
        Positioned(
          bottom: 50,
            right: 50,
            left: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  },
                  child: const Icon(Icons.landscape),
                ),
                FloatingActionButton(
                  onPressed: (){
                    _clear();
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            )
        ),
      ],
    );
  }
}


class LinePainter extends CustomPainter {
  final List<List<Offset>> lines;
  final Color color = Colors.black;
  final Paint _paint = Paint();
  LinePainter(this.lines);
  @override
  void paint(Canvas canvas, Size size) {
    _paint.strokeCap = StrokeCap.round;
    _paint.strokeWidth = 5.0;
    if (lines.isEmpty) {
      canvas.drawPoints(PointMode.polygon, [Offset.zero,Offset.zero], _paint);
    } else {
      for(int i = 0; i < lines.length; i ++) {
        for (int j = 0; j < lines[i].length - 1; j++) {
          if (lines[i][j] != Offset.zero && lines[i][j + 1] != Offset.zero) {
            canvas.drawLine(lines[i][j], lines[i][j+1], _paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



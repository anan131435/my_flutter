import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tips/animation/signature/line_widge.dart';

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  SignaturePainter(this.points);
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 5.0;
    paint.strokeCap = StrokeCap.round;
    for(int i = 0; i< points.length - 1; i++) {
      if (points[i] != null && points[i+ 1] != null) {
        canvas.drawLine(points[i]!, points[i+1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter other) {
    return true;
  }
}

class Signature extends StatefulWidget {
  const Signature({super.key});

  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  List<Offset?> _points = <Offset?>[];
  @override
  Widget build(BuildContext context) {
    print("_SignatureState build");
    // return ElevatedButton(onPressed: (){}, child: Icon(Icons.add));
    return Container(
      color: Colors.red,
      child: Stack(
        children: [
          GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              print(details.localPosition);
              RenderBox? box = context.findRenderObject() as RenderBox;
              Offset localPosition = box.globalToLocal(details.globalPosition);
              print(localPosition);
              setState(() {
                _points = List.from(_points)
                  ..add(localPosition);
              });
            },
            onPanEnd: (details) {
              _points.add(null);
            },
          ),
          CustomPaint(painter: SignaturePainter(_points),size: Size.infinite),
        ],
      ),
    );
  }
}

class PainterDemo extends StatelessWidget {
  const PainterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("签名"),
      ),
      body: LineWidget(),
    );
  }
}



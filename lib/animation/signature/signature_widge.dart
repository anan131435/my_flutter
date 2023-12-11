import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class VVSignature extends StatefulWidget {
  const VVSignature({super.key});

  @override
  State<VVSignature> createState() => _VVSignatureState();
}

class _VVSignatureState extends State<VVSignature> {
  final _controller = HandWriteSignatureController();
  Uint8List? _savedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SignatureWidget(controller: _controller,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () async{
                 final drawData = await _controller.saveImage();
                 setState(() {
                   _savedImage = drawData;
                 });
                },
                icon: const Icon(Icons.save),
              ),
              IconButton(
                onPressed: (){
                  _controller.reset();
                  setState(() {
                    _savedImage = null;
                  });
                },
                icon: Icon(Icons.clear),
              )
            ],
          ),
          Expanded(
              child: _savedImage == null ? const SizedBox() : Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange)
                  ),
                  child: Image.memory(_savedImage!,filterQuality: FilterQuality.high,),
                ),
              )
          ),
        ],
      )
    );
  }
}

class HandWriteSignatureController {
  Function()? _reset;
  Future<Uint8List?> Function()? _saveImage;

  void reset() {
    _reset?.call();
  }
  Future<Uint8List?> saveImage() {
    return _saveImage?.call() ?? Future.value(null);
  }
}



class SignatureWidget extends StatefulWidget {
  final HandWriteSignatureController controller;
  const SignatureWidget({super.key, required this.controller});

  @override
  State<SignatureWidget> createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  //记录一次不间断的手势路径
  Path? _path;
  Offset? _previousOffset;
  //记录所有的笔画
  final List<Path?> _pathList = [];

  @override
  void initState() {
    widget.controller._reset = () {
      setState(() {
        _pathList.clear();
      });
    };
    widget.controller._saveImage = () {
      return _generateImage();
    };
    super.initState();
  }
  Future<Uint8List?> _generateImage() async {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..isAntiAlias = true;
    Rect? bound;
   for (var path in _pathList) {
     if (path != null) {
       var rect = path.getBounds();
       if (bound == null) {
         bound = rect;
       } else {
         bound = bound?.expandToInclude(rect);
       }
     }
   }
   if (bound == null) {
     return null;
   }
   final size = bound!.size;
   //记录画布上产生的行为
   final recorder = ui.PictureRecorder();
   final canvas = Canvas(recorder,bound);
   for (var path in _pathList) {
     if (path != null) {
       var offsetPath = path.shift(Offset(20 - bound!.left, 20 - bound!.top));
       canvas.drawPath(offsetPath, paint);
     }
   }
   //结束记录
    final picture = recorder.endRecording();
    ui.Image img = await picture.toImage(size.width.toInt() + 40, size.height.toInt() + 40);
    var bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return bytes?.buffer.asUint8List();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          var position = details.localPosition;
          _path = Path()..moveTo(position.dx, position.dy);
          _previousOffset = position;
        });
      },
      onPanUpdate: (details){
        setState(() {
          var position = details.localPosition;
          var dx = position.dx;
          var dy = position.dy;
          final previousOffset = _previousOffset;
          if (previousOffset == null) {
            _path?.lineTo(dx, dy);
          } else {
            var previousDx = previousOffset.dx;
            var previousDy = previousOffset.dy;
            _path?.quadraticBezierTo(previousDx, previousDy, (previousDx + dx) / 2, (previousDy + dy) / 2);
          }
          _previousOffset = position;
        });
      },
      onPanEnd: (details) {
        setState(() {
          _pathList.add(_path);
          _previousOffset = null;
          _path = null;
        });
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: VVSignaturePainter(_pathList,_path),
      ),
    );
  }
}

class VVSignaturePainter extends CustomPainter {
  //历史的笔画
  final List<Path?> pathList;
  //当前正在写的笔画
  final Path? currentPath;
  VVSignaturePainter(this.pathList,this.currentPath);

  final _paint = Paint()
  ..color = Colors.black
  ..style = PaintingStyle.stroke
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5
  ..isAntiAlias = true;

  void _drawLine(Canvas canvas, Path? path) {
    if (path == null) return;
    canvas.drawPath(path, _paint);
  }
  @override
  void paint(Canvas canvas, Size size) {
    for(Path? path in pathList) {
      _drawLine(canvas, path);
    }
    _drawLine(canvas, currentPath);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   return true;
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_tips/state_manage/logo_model.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
class MyProviderWidget extends StatefulWidget {
  const MyProviderWidget({Key? key}) : super(key: key);

  @override
  State<MyProviderWidget> createState() => _MyProviderWidgetState();
}

class _MyProviderWidgetState extends State<MyProviderWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MyProvider"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Foo(),
            PannelControl(),
          ],
        ),
      ),
    );
  }
}

class Foo extends StatelessWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LogoModel>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Transform.rotate(
          angle: (model.flipX ? math.pi  : math.pi * 2),
          child: FlutterLogo(
            size: model.size,
          ),
        ),
      ),
    );
  }
}

class PannelControl extends StatefulWidget {
  const PannelControl({Key? key}) : super(key: key);

  @override
  State<PannelControl> createState() => _PannelControlState();
}

class _PannelControlState extends State<PannelControl> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LogoModel>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("flipX"),
                Switch(
                    value: model.flipX,
                    onChanged: (value) {
                      print(value);
                      model.flipX = value;
                    }),
                const Text("flipY"),
                Switch(
                    value: model.flipY,
                    onChanged: (value) {
                      print(value);
                      model.flipY = value;
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Slider"),
                Slider(
                  min: 50,
                    max: 300,
                    value: model.size,
                    onChanged: (value) {
                    model.size = value;
                      print(value);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

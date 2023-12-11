import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../logo_model.dart';
import '../model/logo_model_provider.dart';
class PanelControl extends StatefulWidget {
  const PanelControl({Key? key}) : super(key: key);

  @override
  State<PanelControl> createState() => _PanelControlState();
}

class _PanelControlState extends State<PanelControl> {
  @override
  Widget build(BuildContext context) {
    final model = LogoModelProvider.of(context).model;
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
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
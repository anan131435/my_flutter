import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../logo_model.dart';
import '../model/logo_model_provider.dart';
class Foo extends StatelessWidget {
  const Foo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = LogoModelProvider.of(context).model;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Transform.rotate(
          angle: (model.flipX ? math.pi : math.pi * 2),
          child: FlutterLogo(
            size: model.size,
          ),
        ),
      ),
    );
  }
}
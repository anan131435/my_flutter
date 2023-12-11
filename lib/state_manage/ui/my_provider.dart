import 'package:flutter/material.dart';
import 'package:flutter_tips/state_manage/logo_model.dart';
import 'package:flutter_tips/state_manage/model/logo_model_provider.dart';
import 'package:flutter_tips/state_manage/my_inherited.dart';
class MyModelProvider extends StatefulWidget {
  final Widget child;
  final LogoModel Function() create;
  const MyModelProvider({super.key, required this.create, required this.child}) ;

  @override
  State<MyModelProvider> createState() => _MyModelProviderState();
}

class _MyModelProviderState extends State<MyModelProvider> {
  late LogoModel model;
  @override
  void initState() {
    model = widget.create();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
        builder: (context, child) {
          return LogoModelProvider(
            model: model,
            child: widget.child,
          );
        },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tips/state_manage/ui/foo_widget.dart';
import 'package:flutter_tips/state_manage/ui/panel_control.dart';
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
            PanelControl(),
          ],
        ),
      ),
    );
  }
}





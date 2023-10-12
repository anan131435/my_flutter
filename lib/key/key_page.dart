import 'package:flutter/material.dart';
import 'package:flutter_tips/key/switcher_widget.dart';
class KeyPage extends StatelessWidget {
   KeyPage({super.key});
  final GlobalKey<SwitchWidgetState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('key'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("测试key的page"),
            SwitchWidget(key: globalKey),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          globalKey.currentState!.changeState();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

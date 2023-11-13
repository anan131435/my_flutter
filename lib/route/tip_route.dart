import 'package:flutter/material.dart';
class TipRoute extends StatelessWidget {
  const TipRoute({super.key, required this.tips});
  final String tips;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(tips),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pop({"popParameter": true});
            }, child: const Icon(Icons.backspace_outlined))
          ],
        ),
      ),
    );
  }
}

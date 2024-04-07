import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BoxModel {

  final int count;
  final Color color;

  BoxModel(this.count,this.color);
}

class StateLostPage extends StatefulWidget {
  const StateLostPage({super.key});

  @override
  State<StateLostPage> createState() => _StateLostPageState();
}

class _StateLostPageState extends State<StateLostPage> {
   List<BoxModel> boxModels = [
    BoxModel(3, Colors.blue),
    BoxModel(4, Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Key的作用"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            boxModels = boxModels.reversed.toList();
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                  width: 100,
                  height: 100,
                  color: boxModels[0].color,
                  child: Text("${boxModels[0].count}"),
                ),
              Container(
                width: 100,
                height: 100,
                color: boxModels[1].color,
                child: Text("${boxModels[1].count}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({super.key, required this.color});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: widget.color,
      child: GestureDetector(
        onTap: (){
          setState(() {
            _counter++;
          });
        },
        child: Center(child: Text("$_counter",style: TextStyle(fontSize: 30),)),
      ),
    );
  }
}

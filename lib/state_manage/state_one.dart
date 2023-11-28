import 'package:flutter/material.dart';
import 'dart:core';
class StateOnePage extends StatefulWidget {
  const StateOnePage({Key? key}) : super(key: key);

  @override
  State<StateOnePage> createState() => _StateOnePageState();
}

class _StateOnePageState extends State<StateOnePage> {
  int _count = 0;
  void _increaseCounter() {
    setState(() {
      _count++;
    });
  }
  final DoubleController _holder = DoubleController(0.3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StateOne"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("you have push many times0"),
            Text(
              "$_count",
              style: const TextStyle(fontSize: 45),
            ),
            CounterPage(controller: _holder,),
            ElevatedButton(onPressed: (){
              _holder.setMax();
            }, child: const Icon(Icons.donut_large))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increaseCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// int double 是copy传值,
// 控件访问外部变量通过参数传递传入，修改外部变量通过回调函数在外面修改
class Foo extends StatefulWidget {
  int count;
  void Function() callBack;
  Foo({Key? key, required this.count, required this.callBack}) : super(key: key);

  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '${widget.count}',
            style: const TextStyle(fontSize: 60),
          ),
          ElevatedButton(
            onPressed: () {
              widget.callBack();
            },
            child: const Text("add count"),
          )
        ],
      ),
    );
  }
}

class DoubleController extends ChangeNotifier{
  double _size = 0;
  DoubleController(this._size);
  double get size => _size;
  set size(value) {
    _size = value;
    notifyListeners();
  }
  void setMax() {
    _size = 1.0;
    notifyListeners();
  }
}

class CounterPage extends StatefulWidget {
  final DoubleController controller;
  const CounterPage({super.key, required this.controller});

  @override
  State<CounterPage> createState() => _CounterPageState();
}


class _CounterPageState extends State<CounterPage> {

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        return Container(
          color: Colors.red,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  FlutterLogo(size: widget.controller.size * 100,),
                  Slider(value: widget.controller.size, onChanged: (value){
                    setState(() {
                      widget.controller.size = value;
                    });
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}




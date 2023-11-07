import 'dart:async';
import 'dart:developer';
import 'package:flutter_tips/alert/completer.dart';
import 'package:flutter/material.dart';




class PrintManager {

  void testMain() {
    //编译时常数
    const a = 1;
    const b = "hello";
    const c = a;
    //表达式的所有值在编译时是可知的
    const d = a > 1 ? 2 : 1;

  }

  getData<T>() async {
    Future zyn = Future(() => debugPrint("运行的Future"))
        .then((_) => debugPrint("运行的Future第一个then"))
        .then((_) => debugPrint("运行的Future第二个then"))
        .whenComplete(() => debugPrint("运行的FuturewhenComplete"));
    print(zyn);
  }
  getDataCompleter() async {
    var completer = Completer();
    Future future = completer.future;
    log("completer.future");
    future.then((value) => debugPrint("运行的Future"))
        .then((value) => debugPrint("运行的Future第一个then"))
        .then((value) => debugPrint("运行的Future第2个then"))
        .whenComplete(() => debugPrint("运行的FuturewhenComplete"));
    log("先干点别的");
    completer.complete();
    print("completer.complete()");
  }


  Completer<String> _completer = Completer<String>();
  static PrintManager? _manager;
  PrintManager._internal();
  static PrintManager getInstance() {
    return _manager ??= PrintManager._internal();
  }

   Future<void> doActionTask() async {
    for(int i = 0; i < 10;i ++) {
      log("进入循环第${i}个");
      await _manager?.printe();
    }
  }

  Future<String> printe() async {
    _completer = Completer<String>();
    await sendMessage();
    print("在等待中");
    callBack();
    return _completer.future;
  }

  Future<void> sendMessage() async {
    await Future(() => log("耗时任务，挂起来， 发送消息了 async"));
  }
  static void callBack() {
    if (_manager?._completer.isCompleted == false) {
      print("啊 我回调了, 可以执行下一个了");
      _manager?._completer.complete("true");
    }
  }



}
import 'dart:async';

import 'package:flutter/material.dart';

class SecondsTimer extends StatelessWidget {
  const SecondsTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("倒计时"),
        centerTitle: true,
      ),
      body: TimerTest(
        title: '',
      ),
    );
  }
}

class TimerTest extends StatefulWidget {
  const TimerTest({super.key, required this.title});
  final String title;

  @override
  State<TimerTest> createState() => _TimerTestState();
}

class _TimerTestState extends State<TimerTest> {
  late Timer timer;
  bool _timeState = true;
  String _title = "start";
  String _content = '00:00:00';
  int seconds = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: countDownTest, child: Text(_title)),
            const SizedBox(height: 20,),
            Text(
              _content,
              style: const TextStyle(fontSize: 30,color: Colors.red,),
            )
          ],
        ),
      ),
    );
  }
  void countDownTest() {
    _timeState = !_timeState;
    setState(() {
      if (_timeState) {
        _title = "start";
      } else {
        _title = "stop";
      }
    });
    if (!_timeState) {
      var now = DateTime.now();
      String timeStamp = '${now.hour.toString().padLeft(2,'0')} : '
          '${now.minute.toString().padLeft(2,'0')} :'
          '${now.second.toString().padLeft(2,'0')} ';
      print(now);
      print(timeStamp);
      var twoHours = now.add(Duration()).difference(now);
      seconds = twoHours.inSeconds;
      print(seconds);
      startTimer();
    } else {
      cancelTimer();
    }
  }
  void startTimer() {
    const perid = const Duration(seconds: 1);
    timer = Timer.periodic(perid, (timer) {
      setState(() {
        seconds--;
      });
    });
  }
  void cancelTimer() {
    timer.cancel();
  }
}

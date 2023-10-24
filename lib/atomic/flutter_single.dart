import 'dart:developer';
import 'dart:async';
class FlutterSingleton {
  static FlutterSingleton? _instance;
  //构造方法声明为私有
  FlutterSingleton._();
  static FlutterSingleton getInstance() {
    _instance ??= FlutterSingleton._();
    return _instance!;
  }
}

class SPSingle {
  static SPSingle? _instance;
  String? data;
  static Completer<bool>? _monitor;
  //构造方法声明为私有
  // SPSingle._fromMap(Map<String,dynamic> map) {
  //   data = map['data'];
  // }
  SPSingle._fromMap(Map<String,dynamic> map) : data = map['data'];

  static Future<SPSingle> _fromSharedPreference() async {
    Map<String,String> map = {"data":"mockData"};
    await Future.delayed(const Duration(milliseconds: 10));
    return SPSingle._fromMap(map);
  }

  // static Future<SPSingle> getInstance() async {
  //   _instance ??= await SPSingle._fromSharedPreference();
  //   return _instance!;
  //
  // }

  static Future<SPSingle> getInstance() async {
    if (_instance == null) {
      if (_monitor == null) {
        _monitor = Completer<bool>();
        _instance = await SPSingle._fromSharedPreference();
        _monitor!.complete(true);
      } else {
        await _monitor!.future;
        _monitor = null;
      }
    }
    return _instance!;

  }
}
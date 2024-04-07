import 'dart:ui';
// import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class SysSize {
  static const double avatar = 56;
  // static const double iconBig = 40;
  static const double iconNormal = 24;
  // static const double big = 18;
  // static const double normal = 16;
  // static const double small = 12;
  static const double iconBig = 40;
  static const double big = 16;
  static const double normal = 14;
  static const double small = 12;
}

class StandardTextStyle {
  static const TextStyle big = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: SysSize.big,
  );
  static const TextStyle bigWithOpacity = TextStyle(
    color: Color.fromRGBO(0xff, 0xff, 0xff, .66),
    fontWeight: FontWeight.w600,
    fontSize: SysSize.big,
    inherit: true
  );
}

class Coffee {
  //声明一个非空变量，声明时不初始化，后面一定初始化，有运行时风险
  late String _temperature;
  void heat() {
    _temperature = "hot";
  }
  void chill() {
    _temperature = "iced";
  }

  String server() => "${_temperature}coffee";

}

class MainDart {
  void testFunction() {
    Coffee coffee = Coffee();
    coffee.heat();
    coffee.server();
    //懒加载，只有用到下面的变量才会调用函数
    late String temperature = coffee.server();
  }
}















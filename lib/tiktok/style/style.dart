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



import 'package:flutter/cupertino.dart';

class LogoModel extends ChangeNotifier {
  bool _flipX = false;
  bool _flipY = false;
  double _size = 200;
  bool get flipX =>_flipX;
  bool get flipY =>_flipY;
  double get size =>_size;

  set flipX(value) {
    _flipX = value;
    notifyListeners();
  }
  set flipY(value) {
    _flipY = value;
    notifyListeners();
  }
  set size(value) {
    _size = value;
    notifyListeners();
  }
}

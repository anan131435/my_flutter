// class Person {
//   String name = "zhoujielun";
// }

import 'package:flutter/widgets.dart';

class Person with ChangeNotifier {
  String name = "周杰伦";
  void changeName(String title) {
    name = title;
    notifyListeners();
  }
}

class EatModel {
  final String name;
  EatModel(this.name);
  String get whoEat => "$name is Eating";
}

class Person1 with ChangeNotifier {
  String name = "MultiProvider1";
  void changeName() {
    name = "updateMultiProvider1";
    notifyListeners();
  }
}

class Person2 with ChangeNotifier {
  String name = "MultiProvider2";
  void changeName() {
    name = "updateMultiProvider2";
    notifyListeners();
  }
}

class PersonFuture {
  final String name;
  PersonFuture(this.name);
}
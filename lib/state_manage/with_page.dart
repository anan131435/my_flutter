import 'package:flutter_tips/provider/person.dart';

class Person {
  void eat() {

  }
  void sleep() {

  }

  // final String name;
  // final int age;
  // Person(this.name,this.age);
}
class Student with Person{
  final String roomNum;
  Student(this.roomNum);
  @override
  void eat() {
    print("student eat");
    super.eat();
  }
  @override
  void sleep() {
    print("student sleep");
    super.sleep();
  }
}

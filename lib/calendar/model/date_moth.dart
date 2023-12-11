// 月模型
import 'package:flutter/material.dart';

class DateMonth {
  final DateTime _time;
  DateTime get time => _time;

  late int _year;
  int get year => _year;

  late int _month;
  int get month =>_month;

  late int _maxDays;
  int get maxDays => _maxDays;

  int get weekDay => time.weekday;

  DateMonth(int year,[int month = 1]) : this.dateTime(DateTime(year,month,1));

  DateMonth.dateTime(this._time) {
    _year = time.year;
    _month = time.month;
    _maxDays = DateTime(time.year,time.month + 1,1).add(const Duration(days: -1)).day;
  }

  DateMonth.now() : this.dateTime(DateTime.now());

  DateMonth copyWith({int? year, int? month}) {
    return DateMonth(year ?? this.year, month ??this.month);
  }

  DateMonth subtract(Duration duration) {
    return DateMonth.dateTime(time.subtract(duration));
  }

  DateMonth add( Duration duration) {
    return DateMonth.dateTime(time.add(duration));
  }

  @override
  String toString({String yearSuffix = '-',String mothSuffix = ''}) {
    // String y
    return super.toString();
  }
  String fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >=10) return "${sign}00$absN";
    return "";
  }
}
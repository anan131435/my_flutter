// 月模型
import 'package:flutter/material.dart';
import 'package:flutter_tips/calendar/model/date_day.dart';

class DateMonth {
  final DateTime _time;
  late int _year;
  late int _month;
  late int _maxDays;


  DateTime get time => _time;
  int get year => _year;
  int get month =>_month;
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
    String y = fourDigits(year);
    String m = twoDigits(month);
    return "$y$yearSuffix$m$mothSuffix";

  }
  @override
  bool operator == (Object other) {
    return identical(this, other) || other is DateMonth && num == other.num;
  }

  bool operator >(Object other) {
    return other is DateMonth && runtimeType == other.runtimeType && num >other.num;
  }
  bool contains(DateDay day) {
   return day.year == _year && day.month == _month;
  }


  String fourDigits(int n) {
    int absN = n.abs();
    String sign = n < 0 ? "-" : "";
    if (absN >= 1000) return "$n";
    if (absN >= 100) return "${sign}0$absN";
    if (absN >=10) return "${sign}00$absN";
    return "";
  }
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
  int get num => year * 100 + month;
}
import 'package:flutter_tips/calendar/model/date_moth.dart';

class DateDay extends DateMonth {
  late int _day;
  int get day => _day;
  DateDay(int year, int month, [int day = 1]) : this.dateTime(DateTime(year,month,day));
  DateDay.dateTime(DateTime time) : super.dateTime(time) {
    _day = time.day;
  }
  DateDay.now() : this.dateTime(DateTime.now());
  // DateDay
  
}
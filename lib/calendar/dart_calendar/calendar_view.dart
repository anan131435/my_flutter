import 'package:flutter/material.dart';
import 'package:flutter_tips/calendar/dart_calendar/month_view.dart';

class CalendarWidget extends StatefulWidget {
  final ValueChanged onDateRangeSelected;

  const CalendarWidget({
    super.key,
    required this.onDateRangeSelected,
  });

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late DateTime _selectedStartDate;
  late DateTime _selectedEndDate;
  late DateTime _currentMonth;
  late DateTime _lastSelectedDate;
  @override
  void initState() {
    _currentMonth =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    _selectedStartDate = _currentMonth;
    _selectedEndDate = _selectedStartDate;
    _lastSelectedDate = _selectedStartDate;
    super.initState();
  }

  void _changeMonth(bool next) {
    setState(() {
      if (next) {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      } else {
        _currentMonth =
            DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      }
    });
  }

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      if (selectedDate.isBefore(_selectedStartDate)) {
        _selectedStartDate = selectedDate;
      } else if (selectedDate.isAfter(_selectedEndDate)) {
        _selectedEndDate = selectedDate;
      } else {
        if (selectedDate.isAfter(_lastSelectedDate)) {
          _selectedEndDate = selectedDate;
          _selectedStartDate = _lastSelectedDate;
        } else {
          _selectedStartDate = selectedDate;
          _selectedEndDate = _lastSelectedDate;
        }
      }
      widget.onDateRangeSelected([_selectedStartDate, _selectedEndDate]);
      _lastSelectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            color: Colors.greenAccent,
            height: 60,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("周一"),
                  Text("周二"),
                  Text("周三"),
                  Text("周四"),
                  Text("周五"),
                  Text("周六"),
                  Text("周日"),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _changeMonth(false),
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(
                  "${_currentMonth.month}/${_currentMonth.year}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                IconButton(
                  onPressed: () => _changeMonth(true),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
          MonthView(
            month: _currentMonth,
            selectedStartDate: _selectedStartDate,
            selectedEndDate: _selectedEndDate,
            onDateSelected: _onDateSelected,
          ),
        ],
      ),
    );
  }
}

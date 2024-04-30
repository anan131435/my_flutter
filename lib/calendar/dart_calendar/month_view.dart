import 'package:flutter/material.dart';
class MonthView extends StatelessWidget {
  final DateTime month;
  final DateTime selectedStartDate;
  final DateTime selectedEndDate;
  final Function(DateTime) onDateSelected;
  const MonthView({super.key,
    required this.month,
    required this.selectedStartDate,
    required this.selectedEndDate,
    required this.onDateSelected,
  });

  List<Widget> _buildDayWidgets(BuildContext context) {
    List<Widget> dayTitles = [];
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    print("daysInMonth: ${daysInMonth}");
    final firstDayOfMonth = DateTime(month.year,month.month,1);
    print("firstDayOfMonth:$firstDayOfMonth");
    final firstWeekDayOfMonth = firstDayOfMonth.weekday;
    print("firstWeekDayOfMonth:$firstWeekDayOfMonth");

    for(int i = 0; i < firstWeekDayOfMonth-1; i ++) {
      dayTitles.add(Container());// empty days to align the first day
    }
    for(int i = 1; i <= daysInMonth; i++) {
      final day = DateTime(month.year,month.month,i);
      bool isSelected = (day.isAfter(selectedStartDate.subtract(const Duration(days: 1)))
          && day.isBefore(selectedEndDate.subtract(const Duration(days: 1)))) || day == selectedStartDate || day == selectedEndDate;
      BoxDecoration decoration;
      if (isSelected) {
        decoration = BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        );
      } else {
        decoration = const BoxDecoration();
      }
      dayTitles.add(
        GestureDetector(
          onTap: () {
            onDateSelected(day);
          },
          child: Container(
            decoration: decoration,
            child: Center(
              child: Text(
                "$i",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        )
      );
    }
    return dayTitles;
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      children: _buildDayWidgets(context),
    );
  }
}

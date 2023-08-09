import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_color.dart';

///日期選擇器(日的 Grid)
class CalendarDayGrid extends StatelessWidget {
  final int month;
  final int year;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const CalendarDayGrid(
      {Key? key,
      required this.month,
      required this.year,
      this.firstDate,
      this.lastDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final start = DateTime(year, month);
    final end = DateTime(year, month + 1, 0);
    final offset = start.weekday % DateTime.daysPerWeek;
    final weeksCount =
        ((offset + end.difference(start).inDays + 1) / DateTime.daysPerWeek)
            .ceil();
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 9),
          crossAxisCount: DateTime.daysPerWeek,
          childAspectRatio:
              ((constraints.maxWidth - constraints.maxWidth / 9 * 2) /
                      DateTime.daysPerWeek) /
                  (constraints.maxHeight / weeksCount),
          children: List.generate(weeksCount * DateTime.daysPerWeek, (index) {
            final dateTime = DateTime(year, month, index - offset + 1);
            return DayButton(
              disabled: !(dateTime.year == year &&
                  dateTime.month == month &&
                  (firstDate?.isBefore(dateTime) ?? true) &&
                  (lastDate?.isAfter(dateTime) ?? true)),
              dateTime: dateTime,
            );
          }).toList(),
        );
      },
    );
  }
}

///日期選擇器(天按鈕)
class DayButton extends StatelessWidget {
  final bool disabled;
  final DateTime dateTime;

  const DayButton({Key? key, required this.disabled, required this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled
          ? null
          : () {
              Navigator.of(context).pop(dateTime);
            },
      child: Text(
        '${dateTime.day}',
        style: TextStyle(
            fontSize: 14,
            color: disabled
                ? CalendarColor.disabledColor
                : CalendarColor.enabledColor),
      ),
    );
  }
}

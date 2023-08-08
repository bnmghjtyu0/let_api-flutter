import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_color.dart';

///日期選擇器 (月的 grid)
class CalendarMonthGrid extends StatelessWidget {
  final int? firstMonth;
  final int? lastMonth;
  final Function(int month)? onSelected;

  const CalendarMonthGrid(
      {Key? key, this.firstMonth, this.lastMonth, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ...List.generate(4, (index) {
                    final month = index + 1;
                    bool isEnabled = true;
                    if (firstMonth != null) {
                      isEnabled = isEnabled && firstMonth! <= month;
                    }
                    if (lastMonth != null) {
                      isEnabled = isEnabled && lastMonth! >= month;
                    }
                    return Expanded(
                      child: MonthButton(
                        month: month,
                        disabled: !isEnabled,
                        onPressed: () {
                          onSelected?.call(month);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ...List.generate(4, (index) {
                    final month = index + 5;
                    bool isEnabled = true;
                    if (firstMonth != null) {
                      isEnabled = isEnabled && firstMonth! <= month;
                    }
                    if (lastMonth != null) {
                      isEnabled = isEnabled && lastMonth! >= month;
                    }
                    return Expanded(
                        child: MonthButton(
                            month: month,
                            disabled: !isEnabled,
                            onPressed: () {
                              onSelected?.call(month);
                            }));
                  }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ...List.generate(4, (index) {
                    final month = index + 9;
                    bool isEnabled = true;
                    if (firstMonth != null) {
                      isEnabled = isEnabled && firstMonth! <= month;
                    }
                    if (lastMonth != null) {
                      isEnabled = isEnabled && lastMonth! >= month;
                    }
                    return Expanded(
                      child: MonthButton(
                          month: month,
                          disabled: !isEnabled,
                          onPressed: () {
                            onSelected?.call(month);
                          }),
                    );
                  }),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

final _monthFormat = DateFormat('MMM');

class MonthButton extends StatelessWidget {
  final int month;
  final bool? disabled;
  final VoidCallback? onPressed;

  const MonthButton(
      {Key? key, required this.month, this.disabled, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime(0, month);
    return TextButton(
      onPressed: disabled! ? null : onPressed,
      child: Text(
        _monthFormat.format(dateTime),
        style: TextStyle(
            color: disabled!
                ? CalendarColor.disabledColor
                : CalendarColor.enabledColor),
      ),
    );
  }
}

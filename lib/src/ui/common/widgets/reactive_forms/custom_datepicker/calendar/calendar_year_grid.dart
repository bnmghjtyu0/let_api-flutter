import 'package:flutter/material.dart';
import 'package:let_api_flutter/src/ui/common/widgets/reactive_forms/custom_datepicker/calendar/calendar_color.dart';

///日期選擇器 (年的 grid)
class CalendarYearGrid extends StatelessWidget {
  final int initialYear;
  final int? firstYear;
  final int? lastYear;
  final Function(int year)? onSelected;

  const CalendarYearGrid(
      {Key? key,
      required this.initialYear,
      this.firstYear,
      this.lastYear,
      this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 9),
          crossAxisCount: 4,
          childAspectRatio:
              ((constraints.maxWidth - constraints.maxWidth / 9 * 2) / 4) /
                  (constraints.maxHeight / 6),
          children: List.generate(24, (index) {
            bool isEnabled = true;
            if (firstYear != null) {
              isEnabled = isEnabled && firstYear! <= initialYear + index;
            }
            if (lastYear != null) {
              isEnabled = isEnabled && lastYear! >= initialYear + index;
            }
            return YearButton(
              year: initialYear + index,
              disabled: !isEnabled,
              onPressed: () {
                onSelected?.call(initialYear + index);
              },
            );
          }).toList(),
        );
      },
    );
  }
}

class YearButton extends StatelessWidget {
  final int year;
  final VoidCallback? onPressed;
  final bool? disabled;

  const YearButton(
      {Key? key, required this.year, this.disabled, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled! ? null : onPressed,
      child: Text(
        year.toString(),
        style: TextStyle(
            color: disabled!
                ? CalendarColor.disabledColor
                : CalendarColor.enabledColor),
      ),
    );
  }
}

import 'package:fixnum/fixnum.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_color.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_day_grid.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_model.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_month_grid.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_popup.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/calendar/calendar_year_grid.dart';

final _initialPage = (Int32.MAX_VALUE.toDouble() / 2).round();

///日期選擇器
class Calendar extends StatefulWidget {
  ///日期初始值
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime dateTime)? onPageChanged;

  const Calendar(
      {Key? key,
      required this.initialDate,
      this.firstDate,
      this.lastDate,
      this.onPageChanged})
      : super(key: key);

  ///開啟 calendar
  static Future<DateTime?> show(BuildContext context, double offsetHeight,
      double preferredWidth, lastDate, firstDate) async {
    var date = await Navigator.of(context).push(
      CalendarPopup(
        anchorContext: context,
        offset: Offset(0, offsetHeight),
        mode: CalendarPopupMode.portrait,
        child: PreferredSize(
          preferredSize: Size(preferredWidth, 300),
          child: Calendar(
            initialDate: lastDate,
            firstDate: firstDate,
            lastDate: lastDate,
          ),
        ),
      ),
    );
    return date;
  }

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var _mode = CalendarMode.day;
  late PageController _pageControllerCalendar;
  late PageController _pageControllerYear;
  late int _currentCalendarPage;
  late int _currentYearPage;
  late int _currentYear;
  late int _currentMonth;

  @override
  void initState() {
    super.initState();
    _pageControllerCalendar =
        PageController(initialPage: _currentCalendarPage = _initialPage);
    _pageControllerYear =
        PageController(initialPage: _currentYearPage = _initialPage);
    _currentYear = widget.initialDate.year;
    _currentMonth = widget.initialDate.month;
  }

  @override
  void dispose() {
    _pageControllerCalendar.dispose();
    _pageControllerYear.dispose();
    super.dispose();
  }

  void _prev() {
    switch (_mode) {
      case CalendarMode.year:
        _pageControllerYear.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
      case CalendarMode.month:
        setState(() {
          _currentYear--;
        });
        break;
      case CalendarMode.day:
        _pageControllerCalendar.previousPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
    }
  }

  void _next() {
    switch (_mode) {
      case CalendarMode.year:
        _pageControllerYear.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
      case CalendarMode.month:
        setState(() {
          _currentYear++;
        });
        break;
      case CalendarMode.day:
        _pageControllerCalendar.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ///日期顏色
    Color mainColor = Theme.of(context).primaryColor;

    ///星期
    List<String> weekList = ['日', '一', '二', '三', '四', '五', '六'];

    ///右上角的選擇年月日顯示文字
    String getDropdownText() {
      String text = '';
      switch (_mode) {
        case CalendarMode.year:
          final endYear =
              widget.initialDate.year + (_currentYearPage - _initialPage) * 24;
          text = '${endYear - 23} - $endYear';
          break;
        case CalendarMode.month:
          text = _currentYear.toString();
          break;
        case CalendarMode.day:
          text = '${_currentYear.toString()} 年 ${_currentMonth.toString()} 月';
          break;
      }
      return text;
    }

    return Material(
        color: CalendarColor.backgroundColor,
        child: Container(
            decoration: BoxDecoration(border: Border.all(color: mainColor)),
            child: Column(
              children: [
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Row(
                      children: [
                        SizedBox(width: constraints.maxWidth / 9),

                        ///選擇年月日 dropdown
                        TextButton(
                          child: Row(
                            children: [
                              Text(getDropdownText()),
                              Icon(_mode == CalendarMode.day
                                  ? Icons.arrow_drop_down
                                  : Icons.arrow_drop_up),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              _mode = _mode != CalendarMode.day
                                  ? CalendarMode.day
                                  : CalendarMode.year;
                            });
                          },
                        ),
                        Spacer(),

                        ///左箭頭
                        IconButton(
                          icon: Icon(
                            Icons.chevron_left_rounded,
                            color: mainColor,
                          ),
                          onPressed: _prev,
                        ),

                        ///右箭頭
                        IconButton(
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: mainColor,
                          ),
                          onPressed: _next,
                        ),
                        SizedBox(width: constraints.maxWidth / 9),
                      ],
                    );
                  },
                ),

                ///星期(日~六)
                if (_mode == CalendarMode.day)
                  Row(
                    children: [
                      Spacer(),
                      for (int i = 0; i < weekList.length; i++)
                        Expanded(
                          child: Text(
                            weekList[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      Spacer(),
                    ],
                  ),

                ///天(1~31)
                Expanded(
                  child: IndexedStack(
                    index: _mode.index,
                    children: [
                      ///輪播 (年)
                      PageView.builder(
                        controller: _pageControllerYear,
                        onPageChanged: (value) {
                          setState(() {
                            _currentYearPage = value;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final initialYear = widget.initialDate.year +
                              (index - _initialPage) * 24 -
                              23;
                          return CalendarYearGrid(
                            initialYear: initialYear,
                            firstYear: widget.firstDate?.year,
                            lastYear: widget.lastDate?.year,
                            onSelected: (year) {
                              setState(() {
                                _currentYear = year;
                                _mode = CalendarMode.month;
                              });
                            },
                          );
                        },
                      ),

                      /// (月)
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final firstDate = widget.firstDate;
                          final lastDate = widget.lastDate;
                          var firstMonth = 1;
                          if (firstDate != null) {
                            if (firstDate.year == _currentYear) {
                              firstMonth = firstDate.month;
                            } else if (firstDate.year > _currentYear) {
                              firstMonth = 13;
                            }
                          }
                          var lastMonth = 12;
                          if (lastDate != null) {
                            if (lastDate.year == _currentYear) {
                              lastMonth = lastDate.month;
                            } else if (lastDate.year < _currentYear) {
                              lastMonth = 0;
                            }
                          }
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth / 9),
                            child: CalendarMonthGrid(
                              firstMonth: firstMonth,
                              lastMonth: lastMonth,
                              onSelected: (month) {
                                setState(() {
                                  _currentMonth = month;
                                  _mode = CalendarMode.day;
                                });
                                final page =
                                    (widget.initialDate.year - _currentYear) *
                                            12 +
                                        widget.initialDate.month +
                                        _currentCalendarPage -
                                        _initialPage -
                                        _currentMonth;
                                _pageControllerCalendar
                                    .jumpToPage(_currentCalendarPage -= page);
                              },
                            ),
                          );
                        },
                      ),

                      ///輪播 (日)
                      PageView.builder(
                        controller: _pageControllerCalendar,
                        onPageChanged: (value) {
                          final dateTime = DateTime(
                              widget.initialDate.year,
                              widget.initialDate.month + value - _initialPage,
                              widget.initialDate.day);
                          setState(() {
                            _currentCalendarPage = value;
                            _currentYear = dateTime.year;
                            _currentMonth = dateTime.month;
                          });
                          widget.onPageChanged?.call(dateTime);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          final dateTime = DateTime(
                              widget.initialDate.year,
                              widget.initialDate.month + index - _initialPage,
                              widget.initialDate.day);
                          return CalendarDayGrid(
                            month: dateTime.month,
                            year: dateTime.year,
                            firstDate: widget.firstDate,
                            lastDate: widget.lastDate,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
              ],
            )));
  }
}

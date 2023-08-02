import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/src/ui/common/widgets/reactive_forms/custom_datepicker/calendar/calendar.dart';
import 'package:reactive_forms/reactive_forms.dart';

/// ## Example:
///  see more [ReactiveDatePicker]
///
/// ```dart
/// CustomDatePicker(
///   formControlName: 'birthday',
/// )
/// ```
///

// ReactiveFormField<T, DateTime>
class CustomDatepicker extends StatelessWidget {
  DateTime firstDate;
  DateTime lastDate;
  String? hintText;
  bool? disabled;
  List<TextInputFormatter>? inputFormatters;
  AbstractControl<Object?>? formControl;

  CustomDatepicker(
      {super.key,
      this.hintText,
      this.formControl,
      this.inputFormatters,
      required this.firstDate,
      required this.lastDate}) {
    assert(
      !lastDate.isBefore(firstDate),
      'lastDate $lastDate must be on or after firstDate $firstDate.',
    );
  }

  @override
  Widget build(BuildContext context) {
    ///開啟生日日曆
    void birthdayHandler() async {
      ///視窗偏移位置
      double offsetHeight = 0;

      ///視窗寬度
      double preferredWidth = MediaQuery.of(context).size.width * 0.9;

      ///顯示日期，並取得時間
      Calendar.show(context, offsetHeight, preferredWidth, lastDate, firstDate)
          .then((value) {
        if (value != null) {
          String selectedDate = DateFormat('yyyy/MM/dd').format(value);
          formControl!.patchValue(selectedDate);
        }
      });
    }

    return ReactiveTextField(
      // validationMessages
      // 錯誤訊息定義在 services/validation 資料夾內
      // 使用在 FormControl 內的 validators
      validationMessages: {
        'required': (error) {
          return error as String;
        },
        'invalid': (error) {
          return error as String;
        },
        'apiError': (error) {
          return error as String;
        }
      },
      formControl: formControl as dynamic,
      readOnly: disabled ?? false,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('\\d')),
        LengthLimitingTextInputFormatter(8),
      ],
      decoration: InputDecoration(
        hintText: hintText ?? '',
        suffixIcon: IconButton(
          onPressed: birthdayHandler,
          icon: Icon(Icons.date_range),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}

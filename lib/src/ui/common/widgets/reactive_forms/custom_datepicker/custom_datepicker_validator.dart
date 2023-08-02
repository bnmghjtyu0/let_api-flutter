import 'package:reactive_forms/reactive_forms.dart';

/// 生日
class BirthdayValidator extends Validator<dynamic> {
  DateTime firstDate = DateTime(
      DateTime.now().year - 100, DateTime.now().month, DateTime.now().day - 1);
  DateTime lastDate = DateTime(
      DateTime.now().year - 18, DateTime.now().month, DateTime.now().day - 1);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == "") {
      return {"required": '請輸入生日'};
    }

    /// 檢查是否為 "yyyy/mm/dd" 格式
    var re = RegExp(r"^(19|20)\d\d/(0[1-9]|1[012])/(0[1-9]|[12][0-9]|3[01])$");
    var isTimeFormat = re.hasMatch(control.value);

    if (!isTimeFormat) {
      return {"invalid": '請輸入正確的生日'};
    }
    return null;
  }
}

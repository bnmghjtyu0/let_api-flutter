import 'package:reactive_forms/reactive_forms.dart';

final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}');

class RegisterValidation {
  //帳號
  static Map<String, dynamic>? emailValidator(AbstractControl<dynamic> control) {
    if (control.value == "") {
      return {'required': '請輸入 email'};
    }
    if (!emailRegExp.hasMatch(control.value)) {
      return {'invalid': "請輸入正確的 email"};
    }
    return null;
  }

  //密碼
  static Map<String, dynamic>? passwordValidator(AbstractControl<dynamic> control) {
    if (control.value == "") {
      return {"required": '請輸入密碼'};
    }
    if (!passwordRegExp.hasMatch(control.value)) {
      return {'invalid': "請輸入正確的密碼"};
    }
    return null;
  }
}

import 'package:flutter/services.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomPassword extends StatefulWidget {
  String formControlName;
  String? hintText;
  IconData? icon;
  final String? errorText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  CustomPassword({
    Key? key,
    required this.formControlName,
    this.hintText,
    this.errorText,
    this.icon,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  var focusNode = FocusNode();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    focusNode.addListener(() {
      // 更新渲染 input 元件
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      obscureText: passwordVisible,
      formControlName: widget.formControlName,
      inputFormatters: widget.inputFormatters,
      focusNode: focusNode,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(
              () {
                passwordVisible = !passwordVisible;
              },
            );
          },
        ),
        errorText: widget.errorText,
        contentPadding:
            EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
        hintText: widget.hintText ?? '',
        prefixIcon: Icon(
          widget.icon,
        ),
        prefixIconColor:
            focusNode.hasFocus ? $styles.colors.mainColor : Colors.black,
        //預設樣式
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            )),
        //focus 後的樣式
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              color: $styles.colors.mainColor,
            )),
        errorStyle: TextStyle(
          fontSize: 16.0,
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            )),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

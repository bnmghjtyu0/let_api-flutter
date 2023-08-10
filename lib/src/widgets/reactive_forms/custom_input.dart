// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:let_api_flutter/common_libs.dart';

class CustomInput extends StatefulWidget {
  final String formControlName;
  final String? hintText;
  final IconData? icon;
  final Widget? suffixIcon;
  final String? errorText;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomInput(
      {Key? key,
      required this.formControlName,
      this.hintText,
      this.errorText,
      this.icon,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.suffixIcon})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

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
      formControlName: widget.formControlName,
      inputFormatters: widget.inputFormatters,
      focusNode: focusNode,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        errorText: widget.errorText,
        contentPadding:
            EdgeInsets.only(left: 11, right: 3, top: 14, bottom: 14),
        hintText: widget.hintText ?? '',
        prefixIcon: widget.icon != null
            ? Icon(
                widget.icon,
              )
            : null,
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

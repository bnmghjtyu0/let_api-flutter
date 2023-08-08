import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/common_libs.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/core/constants/dimensions.dart';
import 'package:let_api_flutter/src/core/services/validation/register_validation.dart';
import 'package:let_api_flutter/src/widgets/app_header.dart';
import 'package:let_api_flutter/src/widgets/app_logo.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/custom_datepicker.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_datepicker/custom_datepicker_validator.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_input.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_password.dart';
import 'package:logger/logger.dart';
import 'package:reactive_forms/reactive_forms.dart';

// 註冊頁面
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //註冊頁表單
  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [
        Validators.delegate((control) => RegisterValidation.emailValidator(
            control)) // delegates validation to a custom function
      ],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [
        Validators.delegate(
            (control) => RegisterValidation.passwordValidator(control))
      ],
    ),
    'phone': FormControl<String>(
      value: '',
    ),
    'name': FormControl<String>(
      value: '',
    ),
    'birthday':
        FormControl<String>(value: '', validators: [BirthdayValidator()]),
  });

  ///送出
  submit() {
    var log = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
      ),
    );
    log.d(form.errors);
    form.markAllAsTouched();
    if (form.valid) {}
  }

  @override
  Widget build(BuildContext context) {
    var signUpImages = ["icon_google.png"];
    return Scaffold(
        body: Column(
      children: [
        AppHeader(
            isTransparent: true,
            showCloseBtn: true,
            onClose: () {
              GoRouter.of(context).go(ScreenPaths.home());
            }),
        Expanded(
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AppLogo(size: LogoSize.loginLogo),
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('註冊',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
                              Text('Sign into your account'),
                            ],
                          )),
                      ReactiveForm(
                          formGroup: form,
                          child: Column(children: [
                            CustomInput(
                              formControlName: "email",
                              hintText: 'Email',
                              icon: Icons.mail,
                            ),
                            SizedBox(height: 20),
                            CustomPassword(
                                formControlName: "password",
                                hintText: 'Password',
                                icon: Icons.password),
                            SizedBox(height: 20),
                            CustomInput(
                                formControlName: "phone", //只能輸入英文大小寫
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9]+|\s"),
                                  )
                                ],
                                hintText: 'Phone',
                                icon: Icons.phone),
                            SizedBox(height: 20),
                            CustomInput(
                                formControlName: "name",
                                hintText: 'Name',
                                icon: Icons.person),
                            SizedBox(height: 20),
                            CustomDatepicker(
                                formControl: form.controls['birthday'],
                                hintText: '請輸入西元年月日(例如：1990/01/01)',

                                ///迄日
                                firstDate: DateTime(
                                    DateTime.now().year - 100,
                                    DateTime.now().month,
                                    DateTime.now().day - 1),

                                ///起日
                                lastDate: DateTime(
                                    DateTime.now().year - 18,
                                    DateTime.now().month,
                                    DateTime.now().day - 1)),
                            SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: submit, child: Text('Submit')),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      GoRouter.of(context)
                                          .go(ScreenPaths.login());
                                    },
                                  text: 'Have an account already?',
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 20)),
                            ),
                            SizedBox(
                              height: Dimensions.displaySize.height * 0.05,
                            ),
                            RichText(
                              text: TextSpan(
                                  text:
                                      'Sign up using one of the following methods',
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 16)),
                            ),
                            Wrap(
                              children: List.generate(
                                  1,
                                  (index) => CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            "assets/images/${signUpImages[index]}"),
                                      )),
                            )
                          ])),
                    ],
                  ),
                ),
              ])),
        )
      ],
    ));
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_api_flutter/router.dart';
import 'package:let_api_flutter/src/core/constants/constants.dart';
import 'package:let_api_flutter/src/core/services/validation/register_validation.dart';
import 'package:let_api_flutter/src/widgets/app_header.dart';
import 'package:let_api_flutter/src/widgets/app_logo.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_input.dart';
import 'package:let_api_flutter/src/widgets/reactive_forms/custom_password.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:url_launcher/url_launcher.dart';

//登入頁面
class LoginScreen extends StatelessWidget {
  //登入頁建構式
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //登入頁表單
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
    });

    return Column(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('登入',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40)),
                                Text('Sign into your account'),
                              ],
                            )),
                        ReactiveForm(
                          formGroup: form,
                          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomInput(
                                formControlName: "email",
                                hintText: '信箱',
                                icon: Icons.email),
                            SizedBox(
                              height: 20,
                            ),
                            CustomPassword(
                                formControlName: "password",
                                hintText: '密碼',
                                icon: Icons.password),
                            SizedBox(
                              height: Dimensions.displaySize.height * 0.05,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  form.markAllAsTouched();
                                  if (form.valid) {
                                    GoRouter.of(context).go(ScreenPaths.home());
                                  }
                                },
                                child: Text('登入')),
                            SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            launchUrl(Uri.parse(
                                                'https://www.google.com'));
                                            // GoRouter.of(context)
                                            //     .go(ScreenPaths.register());
                                          },
                                        text: 'Create',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline))
                                  ]),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ])))
      ],
    );
  }
}

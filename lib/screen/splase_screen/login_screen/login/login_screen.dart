//import 'dart:html';

//import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/componanets/custom_text_field.dart';
import 'package:food_app/screen/splase_screen/login_screen/login/register_screen.dart';
import 'package:food_app/utility/app_colors.dart';
import 'package:food_app/utility/constants.dart';
import 'package:food_app/utility/utility_functions.dart';

import '../../../../componanets/custom_dialogbox.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({Key? key}) : super(key: key);

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  bool _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: backgroundcolor,
        body: FadeInRight(
      child: SingleChildScrollView(
          child: Column(children: [
        CustomTop(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhite,
                    ),
                    onPressed: () {},
                    child: Image.asset(Constants.imageAsset('g_letter.png'))),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhite,
                    ),
                    onPressed: () {},
                    child: Image.asset(Constants.imageAsset('fb.png')))
              ],
            ),
            Text(
              'or Login with Email',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    CustomTextField(
                      controller: _email,
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: 300,
                      height: 55,
                      color: kwhite,
                      child: TextField(
                          obscureText: _isObscure,
                          controller: _password,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.red)),

                              //labelText: 'Password',
                              // this button is used to toggle the password visibility
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }))),
                    )
                  ]),
            ),
            SizedBox(height: 21),
            isLoding
                ? Center(child: CircularProgressIndicator())
                : Container(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (inputValidate()) {
                          setState(() {
                            isLoding = true;
                          });

                          AuthController()
                              .signin(context, _email.text, _password.text);

                          setState(() {
                            isLoding = false;
                          });
                        } else {
                          DialogBox().dialogbox(
                            context,
                            DialogType.error,
                            'Inccorect Information',
                            'please enter correct informaion',
                          );
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primarycolor,
                      ),
                    ),
                  ),
            SizedBox(height: 8),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Dont have an Account? ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  )),
              TextSpan(
                text: "Register",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    UtilFunction.navigateTo(context, RegisterScreen());
                  },
              )
            ]))
          ],
        ),
      ])),
    ));
  }

  bool inputValidate() {
    var isValid = false;
    if (_email.text.trim().isEmpty || _password.text.trim().isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}

class CustomTop extends StatelessWidget {
  const CustomTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(Constants.imageAsset('top.png')),
          Positioned(
            top: 59,
            left: 150,
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 92,
            right: 116,
            child: Text(
              'Access account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}

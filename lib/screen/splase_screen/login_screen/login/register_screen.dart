import 'package:animate_do/animate_do.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/componanets/custom_dialogbox.dart';
//import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/componanets/custom_text_field.dart';
import 'package:food_app/utility/app_colors.dart';
import 'package:food_app/utility/constants.dart';
//import 'package:food_app/utility/utility_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeInRight(
      child: SingleChildScrollView(
          child: Column(children: [
        CustomRegisterTop(),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    CustomTextField(
                      controller: _name,
                    ),
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
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    CustomTextField(
                      controller: _phone,
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
            Container(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  if (inputValidation()) {
                    await AuthController().registeruer(context, _email.text,
                        _password.text, _name.text, _phone.text);
                  } else {
                    DialogBox().dialogbox(
                      context,
                      DialogType.error,
                      'Incorrect Information',
                      'please enter correct informaion',
                    );
                  }
                },
                child: Text(
                  'Register',
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
          ],
        )
      ])),
    ));
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty ||
        _name.text.isEmpty ||
        _phone.text.isEmpty ||
        _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}

class CustomRegisterTop extends StatelessWidget {
  CustomRegisterTop({
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
              'Register',
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
              'Create Account',
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

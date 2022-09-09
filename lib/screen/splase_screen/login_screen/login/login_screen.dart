//import 'dart:html';

//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/utility/app_colors.dart';
import 'package:food_app/utility/constants.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({Key? key}) : super(key: key);

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: backgroundcolor,
        body: SingleChildScrollView(
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Email',
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
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
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
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),

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
              onPressed: () {},
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
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don t have an Accont ? ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.black38)),
                Text('Register ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
              ],
            ),
          )
        ],
      ),
    ])));
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

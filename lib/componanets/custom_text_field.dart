import 'package:flutter/material.dart';
import 'package:food_app/utility/app_colors.dart';
import 'package:food_app/utility/constants.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      color: kwhite,
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red))),
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/controller/db_controller.dart';
import 'package:food_app/screen/splase_screen/login_screen/home_screen/homepage.dart';
import 'package:food_app/utility/utility_functions.dart';

import '../componanets/custom_dialogbox.dart';

class AuthController {
  FirebaseAuth auth = FirebaseAuth.instance;

//user registration function
  Future<void> registeruer(
    BuildContext context,
    String email,
    String password,
    String name,
    String phonenum,
  ) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user!.uid.isNotEmpty) {
        DatabaseController()
            .addUser(name, email, phonenum, credential.user!.uid);
      }

      DialogBox().dialogbox(
        context,
        DialogType.success,
        'User account created',
        'Congratulations , Now you can log in',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'The password provided is too weak.',
          'please enter valid password',
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'The account already exists for that email.',
          'please enter valid email',
        );
      }
    } catch (e) {
      print(e);
    }
  }

// user login function
  Future<void> signin(
      BuildContext context, String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        UtilFunction.navigateTo(context, HomePage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'No user found for that email.',
          'please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogbox(
          context,
          DialogType.error,
          'Wrong password provided for that user.',
          'please enter valid Password',
        );
      }
    }
  }
}

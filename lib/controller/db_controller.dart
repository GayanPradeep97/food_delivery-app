import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
//add firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(String name, String email, String phonenum, String uid) {
    // Call the user's CollectionReference to add a new user

    return users
        .doc(uid)
        .set({
          'name': name,
          'email': email,
          'phonenum': phonenum,
          'Uid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

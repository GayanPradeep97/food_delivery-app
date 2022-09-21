import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseController {
//add firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<void> addUser(String name, String email, String phonenum) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name, // John Doe
          'email': email, // Stokes and Sons
          'phonenum': phonenum, // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

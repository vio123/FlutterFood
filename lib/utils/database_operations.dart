import 'package:firebase_database/firebase_database.dart';

class DatabaseOperations{
  static final databaseRef = FirebaseDatabase.instance.ref();
  static void saveUserData(userData) {
    databaseRef.child('users').push().set(userData).then((_) {
      // Data saved successfully
    }).catchError((error) {
      // Error occurred while saving data
      print('Data could not be saved: $error');
    });
  }
}
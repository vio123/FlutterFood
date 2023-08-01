import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DatabaseOperations{
  static final databaseRef = FirebaseDatabase.instance.ref();
  static void saveUserData(userData,context) {
    databaseRef.child('users').push().set(userData).then((_) {
      // Data saved successfully
      Navigator.pushReplacementNamed(context, '/');
    }).catchError((error) {
      // Error occurred while saving data
      print('Data could not be saved: $error');
    });
  }
} 
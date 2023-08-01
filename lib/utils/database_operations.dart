import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseOperations {
  static final CollectionReference usersRef =
  FirebaseFirestore.instance.collection('users');

  static void saveUserData(Map<String, dynamic> userData, BuildContext context) {
    usersRef.add(userData).then((docRef) {
      // Data saved successfully
      Navigator.pushReplacementNamed(context, '/');
    }).catchError((error) {
      // Error occurred while saving data
      print('Data could not be saved: $error');
    });
  }
}

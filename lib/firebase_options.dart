// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBw1LJC-t5rWFf_5UptUVlyyIV_q8vQROQ',
    appId: '1:1055746938253:web:7c4e61b990daf577fdd9c4',
    messagingSenderId: '1055746938253',
    projectId: 'foodflutter-bd75c',
    authDomain: 'foodflutter-bd75c.firebaseapp.com',
    storageBucket: 'foodflutter-bd75c.appspot.com',
    measurementId: 'G-4L14B346PZ',
    databaseURL: "https://foodflutter-bd75c-default-rtdb.firebaseio.com",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfOuFYgNaTK5NXIawFGEfLOp6I4efIq8k',
    appId: '1:1055746938253:android:dbe712126c954a4efdd9c4',
    messagingSenderId: '1055746938253',
    projectId: 'foodflutter-bd75c',
    storageBucket: 'foodflutter-bd75c.appspot.com',
    databaseURL: "https://foodflutter-bd75c-default-rtdb.firebaseio.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg3Ky-sO80aZWOhQR8VFKqwJa8F120TTU',
    appId: '1:1055746938253:ios:b951bf6de5d6e8a5fdd9c4',
    messagingSenderId: '1055746938253',
    projectId: 'foodflutter-bd75c',
    storageBucket: 'foodflutter-bd75c.appspot.com',
    iosClientId: '1055746938253-va9apb58ev01vqq83loca1atr083jf7o.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodFlutter',
    databaseURL: "https://foodflutter-bd75c-default-rtdb.firebaseio.com",
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg3Ky-sO80aZWOhQR8VFKqwJa8F120TTU',
    appId: '1:1055746938253:ios:f9ff71bd683b1cc9fdd9c4',
    messagingSenderId: '1055746938253',
    projectId: 'foodflutter-bd75c',
    storageBucket: 'foodflutter-bd75c.appspot.com',
    iosClientId: '1055746938253-561etvn43hrssppu5uohe9fb74a6ktm3.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodFlutter.RunnerTests',
    databaseURL: "https://foodflutter-bd75c-default-rtdb.firebaseio.com",
  );
}

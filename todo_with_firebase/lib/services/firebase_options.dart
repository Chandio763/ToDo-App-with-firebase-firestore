// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDnk0ksUtVaPKmQHRI7-wtbefs10tUCE3g',
    appId: '1:175518581691:web:0031df94c1b06a8749ba9e',
    messagingSenderId: '175518581691',
    projectId: 'todoapp-8ccd7',
    authDomain: 'todoapp-8ccd7.firebaseapp.com',
    storageBucket: 'todoapp-8ccd7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6aVoVkAi0tRAFCBJZ5NIwP5dAC4qUsa0',
    appId: '1:175518581691:android:875271f48f60b39649ba9e',
    messagingSenderId: '175518581691',
    projectId: 'todoapp-8ccd7',
    storageBucket: 'todoapp-8ccd7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCNckZhjqd0XNfgmxPtD0VcytqdvvWEpoI',
    appId: '1:175518581691:ios:ebc50792bf6254d549ba9e',
    messagingSenderId: '175518581691',
    projectId: 'todoapp-8ccd7',
    storageBucket: 'todoapp-8ccd7.appspot.com',
    iosClientId: '175518581691-o2lesegf38o9vq3tr4a6anet0irvbhkc.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoWithFirebase',
  );
}

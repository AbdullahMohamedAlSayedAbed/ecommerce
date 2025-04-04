// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCND2Kqgu1AWK2aAQm7Un_fMqCWIiwskMc',
    appId: '1:420214891758:web:0333cf5b368f2624033fff',
    messagingSenderId: '420214891758',
    projectId: 'fruits-hup-ea3fb',
    authDomain: 'fruits-hup-ea3fb.firebaseapp.com',
    storageBucket: 'fruits-hup-ea3fb.appspot.com',
    measurementId: 'G-TV3JLGNM6P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWrfOpLgYaxm-sKwy8GU-WVId-iOFvsh0',
    appId: '1:420214891758:android:198322f1c6e5a7ed033fff',
    messagingSenderId: '420214891758',
    projectId: 'fruits-hup-ea3fb',
    storageBucket: 'fruits-hup-ea3fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDq4TbFB-cqUyXzHbFuV3Rf2PSa1jwbrqU',
    appId: '1:420214891758:ios:b0a86487ce4ee652033fff',
    messagingSenderId: '420214891758',
    projectId: 'fruits-hup-ea3fb',
    storageBucket: 'fruits-hup-ea3fb.appspot.com',
    androidClientId:
        '420214891758-tm4h3afvac4ac4rkvdqhucubku91d703.apps.googleusercontent.com',
    iosClientId:
        '420214891758-2hmvg1iddmq5lkgu3j6ah062aj7lik2c.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );
}

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
    apiKey: 'AIzaSyCi-hbvNLeTk9ReQucxUzAFCpk_b09do4c',
    appId: '1:89782834100:web:ad2fed48e8494617b998e1',
    messagingSenderId: '89782834100',
    projectId: 'aice-10463',
    authDomain: 'aice-10463.firebaseapp.com',
    databaseURL: 'https://aice-10463-default-rtdb.firebaseio.com',
    storageBucket: 'aice-10463.appspot.com',
    measurementId: 'G-4C98CSK0S2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX-Lp08CkPueKqP_vW2I-cemWaPLvYQ5Y',
    appId: '1:89782834100:android:fd5d18fd7fd496e8b998e1',
    messagingSenderId: '89782834100',
    projectId: 'aice-10463',
    databaseURL: 'https://aice-10463-default-rtdb.firebaseio.com',
    storageBucket: 'aice-10463.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7p8-hhCAVZUVYSb9aLLyh8xmU83wWG3o',
    appId: '1:89782834100:ios:15a014ca60db9e82b998e1',
    messagingSenderId: '89782834100',
    projectId: 'aice-10463',
    databaseURL: 'https://aice-10463-default-rtdb.firebaseio.com',
    storageBucket: 'aice-10463.appspot.com',
    iosClientId: '89782834100-acvoi21v90o5spkogble52jhi9ett9ne.apps.googleusercontent.com',
    iosBundleId: 'com.edwardtanoto.aice',
  );
}
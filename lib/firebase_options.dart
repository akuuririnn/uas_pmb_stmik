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
    apiKey: 'AIzaSyBQp5zMmd4LFx2-8NJ_Ml9cIrUtOFVoJiM',
    appId: '1:965143939778:web:fc557527a5c88a544a495b',
    messagingSenderId: '965143939778',
    projectId: 'pmb-stmik-182b3',
    authDomain: 'pmb-stmik-182b3.firebaseapp.com',
    storageBucket: 'pmb-stmik-182b3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBa7BAf2TZaOrS_cn1i8y0Ip3E76h-621U',
    appId: '1:965143939778:android:8ac1d39e78484bbe4a495b',
    messagingSenderId: '965143939778',
    projectId: 'pmb-stmik-182b3',
    storageBucket: 'pmb-stmik-182b3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsw6StuRIhUy2HuLePuqj3QfO09mu_xjw',
    appId: '1:965143939778:ios:66ed173a76739d084a495b',
    messagingSenderId: '965143939778',
    projectId: 'pmb-stmik-182b3',
    storageBucket: 'pmb-stmik-182b3.appspot.com',
    iosClientId: '965143939778-vptqtscu8f0mfmi26rfhgabl1gi8kon6.apps.googleusercontent.com',
    iosBundleId: 'com.example.pmbStmik',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsw6StuRIhUy2HuLePuqj3QfO09mu_xjw',
    appId: '1:965143939778:ios:66ed173a76739d084a495b',
    messagingSenderId: '965143939778',
    projectId: 'pmb-stmik-182b3',
    storageBucket: 'pmb-stmik-182b3.appspot.com',
    iosClientId: '965143939778-vptqtscu8f0mfmi26rfhgabl1gi8kon6.apps.googleusercontent.com',
    iosBundleId: 'com.example.pmbStmik',
  );
}
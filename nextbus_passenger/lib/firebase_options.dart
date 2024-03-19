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
    apiKey: 'AIzaSyC2PYzqBv1eG_p7jOvIu4ljYyq6jHETfM4',
    appId: '1:620669314084:web:c539b4c6341048428ca4b1',
    messagingSenderId: '620669314084',
    projectId: 'next-bus-rbt-3a502',
    authDomain: 'next-bus-rbt-3a502.firebaseapp.com',
    storageBucket: 'next-bus-rbt-3a502.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBsxELn_PL513ny9ZMo8AORfg0tf-m2aKk',
    appId: '1:620669314084:android:76d2ef890b605b258ca4b1',
    messagingSenderId: '620669314084',
    projectId: 'next-bus-rbt-3a502',
    storageBucket: 'next-bus-rbt-3a502.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABV-nYhUVp4kHV5RZSxBDYg8ET2PkpFGo',
    appId: '1:620669314084:ios:ff56af3ed65e03998ca4b1',
    messagingSenderId: '620669314084',
    projectId: 'next-bus-rbt-3a502',
    storageBucket: 'next-bus-rbt-3a502.appspot.com',
    iosBundleId: 'com.example.nextbusPassenger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABV-nYhUVp4kHV5RZSxBDYg8ET2PkpFGo',
    appId: '1:620669314084:ios:5d212e16845ecf4d8ca4b1',
    messagingSenderId: '620669314084',
    projectId: 'next-bus-rbt-3a502',
    storageBucket: 'next-bus-rbt-3a502.appspot.com',
    iosBundleId: 'com.example.nextbusPassenger.RunnerTests',
  );
}

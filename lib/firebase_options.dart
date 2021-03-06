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
        return windows;
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
    apiKey: 'AIzaSyBrvUv-RJ1_J8HkmE1maobtjvgNvQLOJRc',
    appId: '1:1001806376982:web:63a3b4858815a1d75ec537',
    messagingSenderId: '1001806376982',
    projectId: 'alpha-value-app',
    authDomain: 'alpha-value-app.firebaseapp.com',
    storageBucket: 'alpha-value-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBtPFJfh9IS8piLCd4CU1H5zyUlP72B8Ps',
    appId: '1:1001806376982:android:07e377859e82a8ba5ec537',
    messagingSenderId: '1001806376982',
    projectId: 'alpha-value-app',
    storageBucket: 'alpha-value-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAHSi1V0A7fgztjyhJtGUso6i6OE2kzuCo',
    appId: '1:1001806376982:ios:567aa312e9b9ac1b5ec537',
    messagingSenderId: '1001806376982',
    projectId: 'alpha-value-app',
    storageBucket: 'alpha-value-app.appspot.com',
    iosClientId: '1001806376982-kr0rqqja0arks7vrlqpl8bevn9lgjrk4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterCotacoes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBrvUv-RJ1_J8HkmE1maobtjvgNvQLOJRc',
    appId: '1:1001806376982:web:50143c04989806b35ec537',
    messagingSenderId: '1001806376982',
    projectId: 'alpha-value-app',
    authDomain: 'alpha-value-app.firebaseapp.com',
    storageBucket: 'alpha-value-app.appspot.com',
  );
}

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
    apiKey: 'AIzaSyCxpCBzihK4RWAGjcbR5Z12YMfkMFD12wI',
    appId: '1:983452743355:web:86f00cc5931bbded485b9e',
    messagingSenderId: '983452743355',
    projectId: 'your-classmate',
    authDomain: 'your-classmate.firebaseapp.com',
    storageBucket: 'your-classmate.appspot.com',
    measurementId: 'G-2QM1W4NMPV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjDJ9ZLPtQKRTZV73MzZA23_RLzDCiKqE',
    appId: '1:983452743355:android:ec17c7737d09fcfd485b9e',
    messagingSenderId: '983452743355',
    projectId: 'your-classmate',
    storageBucket: 'your-classmate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIfM419yRTD8DqbVdRqNIWWmFIdfJGyO8',
    appId: '1:983452743355:ios:c78d0c5d110898d1485b9e',
    messagingSenderId: '983452743355',
    projectId: 'your-classmate',
    storageBucket: 'your-classmate.appspot.com',
    iosClientId: '983452743355-tivdd0unmjd9lduheaedsut6dp03i87t.apps.googleusercontent.com',
    iosBundleId: 'com.example.classmate',
  );
}
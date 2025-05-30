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
        return macos;
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
    apiKey: 'AIzaSyBgkg0lQjegDNDDMbBwFIsIWl5BffKQCHc',
    appId: '1:702197174881:web:b82210fc41a58d02be1020',
    messagingSenderId: '702197174881',
    projectId: 'trendbuy-app-7508',
    authDomain: 'trendbuy-app-7508.firebaseapp.com',
    storageBucket: 'trendbuy-app-7508.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn9ivneIB9jKh_Zg33HWVfr-mJ6ZLearY',
    appId: '1:702197174881:android:2872f79c6dde6559be1020',
    messagingSenderId: '702197174881',
    projectId: 'trendbuy-app-7508',
    storageBucket: 'trendbuy-app-7508.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCly22AWbYKP23kCn7UNOVHb6Hp1myNP34',
    appId: '1:702197174881:ios:30d268d22ce395c2be1020',
    messagingSenderId: '702197174881',
    projectId: 'trendbuy-app-7508',
    storageBucket: 'trendbuy-app-7508.firebasestorage.app',
    iosBundleId: 'com.example.trendbuy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCly22AWbYKP23kCn7UNOVHb6Hp1myNP34',
    appId: '1:702197174881:ios:30d268d22ce395c2be1020',
    messagingSenderId: '702197174881',
    projectId: 'trendbuy-app-7508',
    storageBucket: 'trendbuy-app-7508.firebasestorage.app',
    iosBundleId: 'com.example.trendbuy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBgkg0lQjegDNDDMbBwFIsIWl5BffKQCHc',
    appId: '1:702197174881:web:6d1ca320e5ce3c97be1020',
    messagingSenderId: '702197174881',
    projectId: 'trendbuy-app-7508',
    authDomain: 'trendbuy-app-7508.firebaseapp.com',
    storageBucket: 'trendbuy-app-7508.firebasestorage.app',
  );
}

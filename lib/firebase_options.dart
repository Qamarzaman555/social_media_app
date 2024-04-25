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
    apiKey: 'AIzaSyARa0uPYJz4kZzshRhP63gHGk72RqSlVdI',
    appId: '1:11418575133:web:71ab21115cb53227dd41f4',
    messagingSenderId: '11418575133',
    projectId: 'socail-media-app-9d27c',
    authDomain: 'socail-media-app-9d27c.firebaseapp.com',
    databaseURL: 'https://socail-media-app-9d27c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socail-media-app-9d27c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADreMUO8ElYB3_pnyXMuOq1MbIudgJUds',
    appId: '1:11418575133:android:f8ea516c86ab7e16dd41f4',
    messagingSenderId: '11418575133',
    projectId: 'socail-media-app-9d27c',
    databaseURL: 'https://socail-media-app-9d27c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socail-media-app-9d27c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaxyelrwnL42Y34qnnCRaKRn29sG-Mnf4',
    appId: '1:11418575133:ios:86df9df9e335797bdd41f4',
    messagingSenderId: '11418575133',
    projectId: 'socail-media-app-9d27c',
    databaseURL: 'https://socail-media-app-9d27c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socail-media-app-9d27c.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAaxyelrwnL42Y34qnnCRaKRn29sG-Mnf4',
    appId: '1:11418575133:ios:86df9df9e335797bdd41f4',
    messagingSenderId: '11418575133',
    projectId: 'socail-media-app-9d27c',
    databaseURL: 'https://socail-media-app-9d27c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socail-media-app-9d27c.appspot.com',
    iosBundleId: 'com.example.socialMediaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARa0uPYJz4kZzshRhP63gHGk72RqSlVdI',
    appId: '1:11418575133:web:538a95c5efb7c1c9dd41f4',
    messagingSenderId: '11418575133',
    projectId: 'socail-media-app-9d27c',
    authDomain: 'socail-media-app-9d27c.firebaseapp.com',
    databaseURL: 'https://socail-media-app-9d27c-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'socail-media-app-9d27c.appspot.com',
  );
}

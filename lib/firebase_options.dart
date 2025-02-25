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
    apiKey: 'AIzaSyBadWxiH3lH8nf1CBa6JKnFYFgWF157Q_Q',
    appId: '1:908510805802:web:b36eac445a157190f5e853',
    messagingSenderId: '908510805802',
    projectId: 'grocery-app-bb721',
    authDomain: 'grocery-app-bb721.firebaseapp.com',
    storageBucket: 'grocery-app-bb721.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBM4bVzsZVFu5CHnKrGcknMYnV4gajtEW4',
    appId: '1:908510805802:android:712f31fe49db83b6f5e853',
    messagingSenderId: '908510805802',
    projectId: 'grocery-app-bb721',
    storageBucket: 'grocery-app-bb721.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZjuxgg106INAIR_QkfH2jp53giQzhRfw',
    appId: '1:908510805802:ios:f08bd744f7122695f5e853',
    messagingSenderId: '908510805802',
    projectId: 'grocery-app-bb721',
    storageBucket: 'grocery-app-bb721.appspot.com',
    iosBundleId: 'com.example.groceryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZjuxgg106INAIR_QkfH2jp53giQzhRfw',
    appId: '1:908510805802:ios:9c44bc3f0b258c64f5e853',
    messagingSenderId: '908510805802',
    projectId: 'grocery-app-bb721',
    storageBucket: 'grocery-app-bb721.appspot.com',
    iosBundleId: 'com.example.groceryApp.RunnerTests',
  );
}

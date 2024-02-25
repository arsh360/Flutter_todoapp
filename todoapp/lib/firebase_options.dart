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
    apiKey: 'AIzaSyADh2AzSW0q2on5Ae3qb-FuBUSKnilHFqk',
    appId: '1:361069973347:web:cbf7f641bb256ccad60d56',
    messagingSenderId: '361069973347',
    projectId: 'todo-d4bbb',
    authDomain: 'todo-d4bbb.firebaseapp.com',
    storageBucket: 'todo-d4bbb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-CpY6B6751tWPfPyZd3ashqgKqauFxvs',
    appId: '1:361069973347:android:fba7c37e04171659d60d56',
    messagingSenderId: '361069973347',
    projectId: 'todo-d4bbb',
    storageBucket: 'todo-d4bbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-4hQsGmlJ5mtKna1waOu4GWxhVZw0UtA',
    appId: '1:361069973347:ios:21d1908ffc1e9608d60d56',
    messagingSenderId: '361069973347',
    projectId: 'todo-d4bbb',
    storageBucket: 'todo-d4bbb.appspot.com',
    iosBundleId: 'com.example.todoapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-4hQsGmlJ5mtKna1waOu4GWxhVZw0UtA',
    appId: '1:361069973347:ios:7a77c8a3bc8debead60d56',
    messagingSenderId: '361069973347',
    projectId: 'todo-d4bbb',
    storageBucket: 'todo-d4bbb.appspot.com',
    iosBundleId: 'com.example.todoapp.RunnerTests',
  );
}

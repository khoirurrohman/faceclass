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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeE5YgsiQZGwkIJXQ6ymfR72uYGGzJwQc',
    appId: '1:533963351798:android:9ae4fcf8c0e7ac29bfeed7',
    messagingSenderId: '533963351798',
    projectId: 'faceclass-a66ec',
    storageBucket: 'faceclass-a66ec.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeE5YgsiQZGwkIJXQ6ymfR72uYGGzJwQc',
    appId: '1:533963351798:ios:9ae4fcf8c0e7ac29bfeed7',
    messagingSenderId: '533963351798',
    projectId: 'faceclass-a66ec',
    storageBucket: 'faceclass-a66ec.firebasestorage.app',
    iosBundleId: 'com.example.faceclass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeE5YgsiQZGwkIJXQ6ymfR72uYGGzJwQc',
    appId: '1:533963351798:ios:9ae4fcf8c0e7ac29bfeed7',
    messagingSenderId: '533963351798',
    projectId: 'faceclass-a66ec',
    storageBucket: 'faceclass-a66ec.firebasestorage.app',
    iosBundleId: 'com.example.faceclass',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCeE5YgsiQZGwkIJXQ6ymfR72uYGGzJwQc',
    appId: '1:533963351798:web:9ae4fcf8c0e7ac29bfeed7',
    messagingSenderId: '533963351798',
    projectId: 'faceclass-a66ec',
    authDomain: 'faceclass-a66ec.firebaseapp.com',
    storageBucket: 'faceclass-a66ec.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCeE5YgsiQZGwkIJXQ6ymfR72uYGGzJwQc',
    appId: '1:533963351798:web:9ae4fcf8c0e7ac29bfeed7',
    messagingSenderId: '533963351798',
    projectId: 'faceclass-a66ec',
    authDomain: 'faceclass-a66ec.firebaseapp.com',
    storageBucket: 'faceclass-a66ec.firebasestorage.app',
  );
}

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
    apiKey: 'AIzaSyA-c1KEStnBATiXpE_CeMsLBJJ7W_O7Zvw',
    appId: '1:915967892430:web:daba73769f593172f5e99f',
    messagingSenderId: '915967892430',
    projectId: 'techbuddy-7b7c6',
    authDomain: 'techbuddy-7b7c6.firebaseapp.com',
    storageBucket: 'techbuddy-7b7c6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK_qbMkWQficesEPaBiB4SmbaBS1wJ1TE',
    appId: '1:915967892430:android:5cd1c74e5743d8c8f5e99f',
    messagingSenderId: '915967892430',
    projectId: 'techbuddy-7b7c6',
    storageBucket: 'techbuddy-7b7c6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCASvBtyZbvExJP9Aee0b60si_kMB3wY0E',
    appId: '1:915967892430:ios:adb231bf194a1257f5e99f',
    messagingSenderId: '915967892430',
    projectId: 'techbuddy-7b7c6',
    storageBucket: 'techbuddy-7b7c6.appspot.com',
    iosBundleId: 'com.example.other',
  );
}

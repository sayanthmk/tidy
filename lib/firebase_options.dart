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
    apiKey: 'AIzaSyAuXrFIMTDtH_Xp3Ajmmvb3AhQSPPR_sx8',
    appId: '1:550963527567:web:434522972c8bf7b19855fa',
    messagingSenderId: '550963527567',
    projectId: 'crudtutorial-cf547',
    authDomain: 'crudtutorial-cf547.firebaseapp.com',
    storageBucket: 'crudtutorial-cf547.firebasestorage.app',
    measurementId: 'G-Z1MG2H61H0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYVH4I0pr02RmSMW2jUbfG0CtQWEigtpY',
    appId: '1:550963527567:android:e8cd80c4abde450b9855fa',
    messagingSenderId: '550963527567',
    projectId: 'crudtutorial-cf547',
    storageBucket: 'crudtutorial-cf547.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAX_zxUyOj8RGe6h-HeEX7sGHYnlihyQys',
    appId: '1:550963527567:ios:1e4399bcf917635b9855fa',
    messagingSenderId: '550963527567',
    projectId: 'crudtutorial-cf547',
    storageBucket: 'crudtutorial-cf547.firebasestorage.app',
    iosBundleId: 'com.example.serviceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAX_zxUyOj8RGe6h-HeEX7sGHYnlihyQys',
    appId: '1:550963527567:ios:1e4399bcf917635b9855fa',
    messagingSenderId: '550963527567',
    projectId: 'crudtutorial-cf547',
    storageBucket: 'crudtutorial-cf547.firebasestorage.app',
    iosBundleId: 'com.example.serviceapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDt9PQ77rSMFgXFUp048-l5zUah-ZBgFQw',
    appId: '1:550963527567:web:162ab2a08cfa679f9855fa',
    messagingSenderId: '550963527567',
    projectId: 'crudtutorial-cf547',
    authDomain: 'crudtutorial-cf547.firebaseapp.com',
    storageBucket: 'crudtutorial-cf547.firebasestorage.app',
    measurementId: 'G-4NZ9VKYK6C',
  );
}


import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyBgvY2hzw2EsZZygxrBocZK4d7B5faTJIY',
    appId: '1:580906505648:web:7ad3d8ea6130f6de62b275',
    messagingSenderId: '580906505648',
    projectId: 'flutter-e-commerce-5c6e7',
    authDomain: 'flutter-e-commerce-5c6e7.firebaseapp.com',
    storageBucket: 'flutter-e-commerce-5c6e7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfup4GtE2BExhdEEP57yoG_TCH7a6IZgA',
    appId: '1:580906505648:android:f32a58e148ba870762b275',
    messagingSenderId: '580906505648',
    projectId: 'flutter-e-commerce-5c6e7',
    storageBucket: 'flutter-e-commerce-5c6e7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFAAbobGFza5NePTZ9bv7GZMr8mwiEKnc',
    appId: '1:580906505648:ios:6a3ab8f5b308fa7562b275',
    messagingSenderId: '580906505648',
    projectId: 'flutter-e-commerce-5c6e7',
    storageBucket: 'flutter-e-commerce-5c6e7.appspot.com',
    androidClientId: '580906505648-dktpp45lmdgnmrmlnaa5jaeecrtd06rf.apps.googleusercontent.com',
    iosClientId: '580906505648-dncsead3sn1i2mvlsofv1gob9v5bqigh.apps.googleusercontent.com',
    iosBundleId: 'com.example.cwtEcommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyypc4MyqBBneptEWpF17u3s7cu8X4wIY',
    appId: '1:823307041176:ios:3be076689b6866ea0653ed',
    messagingSenderId: '823307041176',
    projectId: 'codingwitht-c6d0f',
    storageBucket: 'codingwitht-c6d0f.appspot.com',
    androidClientId: '823307041176-qfcmju8p2mbqre4rl5kufhr7dhs9hs33.apps.googleusercontent.com',
    iosClientId: '823307041176-7pen3ehk09mbnp7ukg6lm4a9sgr80pjr.apps.googleusercontent.com',
    iosBundleId: 'com.example.cwtEcommerceApp.RunnerTests',
  );
}
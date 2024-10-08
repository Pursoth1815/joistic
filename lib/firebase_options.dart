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
    apiKey: 'AIzaSyDI9i4w_qdmsjINz9yi37WEF6mmxcdTtds',
    appId: '1:109673687675:web:38e572d639f4a96cb490de',
    messagingSenderId: '109673687675',
    projectId: 'joistic-2744c',
    authDomain: 'joistic-2744c.firebaseapp.com',
    storageBucket: 'joistic-2744c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAS-YgCmxlBOy4jGLy5kQvbpjNhkygWu7c',
    appId: '1:109673687675:android:c769c4e4091fe48ab490de',
    messagingSenderId: '109673687675',
    projectId: 'joistic-2744c',
    storageBucket: 'joistic-2744c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAc5AsmoitR50-MPSsN87AZUHP8TmTEzo',
    appId: '1:109673687675:ios:eec79eb39f860140b490de',
    messagingSenderId: '109673687675',
    projectId: 'joistic-2744c',
    storageBucket: 'joistic-2744c.appspot.com',
    iosClientId: '109673687675-o0nv1u1m4u1srcquiecnm1klrncdos57.apps.googleusercontent.com',
    iosBundleId: 'com.application.joistic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAc5AsmoitR50-MPSsN87AZUHP8TmTEzo',
    appId: '1:109673687675:ios:eec79eb39f860140b490de',
    messagingSenderId: '109673687675',
    projectId: 'joistic-2744c',
    storageBucket: 'joistic-2744c.appspot.com',
    iosClientId: '109673687675-o0nv1u1m4u1srcquiecnm1klrncdos57.apps.googleusercontent.com',
    iosBundleId: 'com.application.joistic',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDI9i4w_qdmsjINz9yi37WEF6mmxcdTtds',
    appId: '1:109673687675:web:a8d394f00bcb1364b490de',
    messagingSenderId: '109673687675',
    projectId: 'joistic-2744c',
    authDomain: 'joistic-2744c.firebaseapp.com',
    storageBucket: 'joistic-2744c.appspot.com',
  );
}

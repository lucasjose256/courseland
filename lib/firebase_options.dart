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
    apiKey: 'AIzaSyB2RxjDeK3LPZ7bmbDDRfZ4a6TFm5qyxMc',
    appId: '1:637205558496:web:08d71022319356afba0c85',
    messagingSenderId: '637205558496',
    projectId: 'couserland',
    authDomain: 'couserland.firebaseapp.com',
    storageBucket: 'couserland.appspot.com',
    measurementId: 'G-DDPZX2EHH3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIEoJrQSh-tyuC0D_GmeGUGLN_YbpPj5c',
    appId: '1:637205558496:android:6d21e7f9050a98adba0c85',
    messagingSenderId: '637205558496',
    projectId: 'couserland',
    storageBucket: 'couserland.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpbrsCokCpb4JM0-q53aNFvARFJwRnGng',
    appId: '1:637205558496:ios:29bfc92c970eb726ba0c85',
    messagingSenderId: '637205558496',
    projectId: 'couserland',
    storageBucket: 'couserland.appspot.com',
    androidClientId: '637205558496-auipu3dm8team4nd91qc1ho5771avqu9.apps.googleusercontent.com',
    iosClientId: '637205558496-nujl8kmdmkshqs1hk2m6ornt5hbhf1he.apps.googleusercontent.com',
    iosBundleId: 'com.example.courseland',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpbrsCokCpb4JM0-q53aNFvARFJwRnGng',
    appId: '1:637205558496:ios:29bfc92c970eb726ba0c85',
    messagingSenderId: '637205558496',
    projectId: 'couserland',
    storageBucket: 'couserland.appspot.com',
    androidClientId: '637205558496-auipu3dm8team4nd91qc1ho5771avqu9.apps.googleusercontent.com',
    iosClientId: '637205558496-nujl8kmdmkshqs1hk2m6ornt5hbhf1he.apps.googleusercontent.com',
    iosBundleId: 'com.example.courseland',
  );
}

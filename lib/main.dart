import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // debugPaintBaselinesEnabled = true;
  // debugPaintSizeEnabled = true;
  // debugPaintLayerBordersEnabled = true;

  // Firebase
  await Firebase.initializeApp();
  // Crashlytics
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError(errorDetails);
  };

  runZonedGuarded(() {
    runApp(const ProviderScope(child: App()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

// FirebaseOptions getFirebaseOptions() {
//   const flavor = String.fromEnvironment('FLAVOR');
//   switch (flavor) {
//     case 'staging':
//       return stg.DefaultFirebaseOptions.currentPlatform;
//     case 'production':
//       return production.DefaultFirebaseOptions.currentPlatform;
//     default:
//       throw ArgumentError('Not available flavor');
//   }
// }


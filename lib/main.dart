import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'core/constants/app_assets.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await EasyLocalization.ensureInitialized();
    await initApp();
    FlutterNativeSplash.remove();
    runApp(EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('vi')],
        path: AppAssets.translationsPath,
        startLocale: const Locale('vi'),
        fallbackLocale: const Locale('vi'),
        child: const ComicApp()));
  }, (error, stack) {
    log('runZonedGuarded: Caught error: $error');
    // log(stack);
    stack.toString().split('\n').forEach((element) {
      log(element);
    });
  });
}

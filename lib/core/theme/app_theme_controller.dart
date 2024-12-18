
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/source/local/local_storage.dart';
import 'app_color.dart';
import 'app_theme.dart';

class AppThemeController extends GetxController
    with GetTickerProviderStateMixin {
  RxBool darkMode = false.obs;
  AppThemeData appThemeData = lightAppThemeData;
  LocalStorage get store => Get.find<LocalStorage>();

  ThemeData getTheme() {
    return isDarkMode() ? AppTheme().darkTheme : AppTheme().lightTheme;
  }

  bool isDarkMode() {
    return darkMode.value;
  }

  @override
  void onInit() {
    darkMode.value = store.darkMode;
    updateThemeData();
    super.onInit();
  }

  resetTheme() {
    Get.changeTheme(getTheme());
  }

  Future<void> swapTheme({GlobalKey? key}) async {
    darkMode.value = !darkMode.value;
    store.darkMode = !store.darkMode;
    Get.changeThemeMode(ThemeMode.light);
    Get.changeTheme(getTheme());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarColor: store.darkMode ? Colors.black : Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    update();
  }

  void updateThemeData() {
    appThemeData = isDarkMode() ? darkAppThemeData : lightAppThemeData;
    Get.changeThemeMode(isDarkMode() ? ThemeMode.dark : ThemeMode.light);
  }
}

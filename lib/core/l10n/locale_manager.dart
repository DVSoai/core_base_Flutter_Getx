
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/source/local/local_storage.dart';

class LanguageOption {
  final Locale locale;
  final String displayName;
  final String flagIcon;

  LanguageOption({
    required this.locale,
    required this.displayName,
    required this.flagIcon,
  });
}

class LanguageManager extends GetxController {
  LocalStorage get store => Get.find<LocalStorage>();

  List<LanguageOption> getLanguageOptions() {
    return [
      LanguageOption(
        locale: const Locale('en'),
        displayName: 'English',
        flagIcon: '🇺🇸',
      ),
      LanguageOption(
        locale: const Locale('vi'),
        displayName: 'Tiếng Việt',
        flagIcon: '🇻🇳',
      ),
    ];
  }

  void setSelectedLanguage(Locale locale, String code) {
    onUpdateLanguge(locale, code);
  }

  Locale getSelectedLanguage() {
    return store.locale;
  }

  Future<void> onUpdateLanguge(Locale locale, String code) async {}

  Future<void> changeLanguage({
    required Locale locale,
  }) async {
    await Get.context!.setLocale(locale);
    Get.context!.setLocale(locale);
    Get.updateLocale(locale);
    store.locale = locale;
  }
}

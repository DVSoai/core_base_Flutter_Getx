import 'package:flutter/material.dart';
import 'package:get/get.dart';

void closeKeyboard() {
  if (FocusScope.of(Get.context!).hasFocus) {
    FocusScope.of(Get.context!).unfocus();
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../provider/main_provider.dart';
import '../app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  // Nhận AuthController thông qua dependency injection
  final _mainProvider = Get.find<MainProvider>();
  @override
  RouteSettings? redirect(String? route) {
    if (_mainProvider.isLoggedIn.isFalse && route != AppRoutes.login) {
      log("User id ${_mainProvider.isLoggedIn.isFalse} redirect to login");
      return const RouteSettings(name: AppRoutes.welcome);
    }
    return null;
  }
}

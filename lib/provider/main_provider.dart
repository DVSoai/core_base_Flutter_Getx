import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/source/local/local_storage.dart';

class MainProvider {
  final Connectivity _connectivity = Connectivity();
  final _storage = Get.find<LocalStorage>();
  Rx<bool> isLoggedIn = false.obs;
  // Rx<UserMapper?> user = Rx<UserMapper?>(null);
  RxBool hasInternetConnection = true.obs;
  StreamSubscription? subscriptionInternet;


  // updateCurrentUser(UserMapper? userValue) {
  //   user.value = userValue;
  //   isLoggedIn.value = userValue != null;
  // }
  //
  // updateUserCards(List<CardMapper> cards) {
  //   userCards.value = [...cards];
  // }
  //
  //
  // bool isLoggedInUser() {
  //   return isLoggedIn.value &&
  //       user.value != null &&
  //       _storage.accessToken!.isNotEmpty;
  // }
  //
  // clearUser() {
  //   user.value = null;
  //   isLoggedIn.value = false;
  //   _storage.accessToken = '';
  // }

  Future<bool> hasConnectInternet() async {
    List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
      final value = result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi);
      return value;
    } catch (e) {
      // Handle any potential errors here.
      // You may want to log or handle exceptions appropriately.
      return false;
    }
  }

  Future<void> checkConnect() async {
    List<ConnectivityResult> result;
    subscriptionInternet?.cancel();
    try {
      result = await _connectivity.checkConnectivity();
      _updateStatus(result.first);
      subscriptionInternet =
          _connectivity.onConnectivityChanged.listen((event) {
            _updateStatus(event.first);
          });
    } catch (e) {
      // Handle any potential errors here.
      // You may want to log or handle exceptions appropriately.
      subscriptionInternet = null;
    }
  }

  void _updateStatus(ConnectivityResult event) {
    switch (event) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        hasInternetConnection.value = true;
        break;
      case ConnectivityResult.none:
        hasInternetConnection.value = false;
        break;
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.vpn:
      case ConnectivityResult.other:
        break;
    }
  }
}
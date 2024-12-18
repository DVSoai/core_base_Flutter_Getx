



import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../provider/main_provider.dart';
import 'mixin_navigator.dart';

abstract class BaseController extends GetxController with NavigationPage {
  late SMITrigger _error;
  late SMITrigger _success;
  late SMITrigger _resetLoading;
  late SMITrigger _confetti;
  var isLoading = false.obs;
  final mainProvider = Get.find<MainProvider>();
}
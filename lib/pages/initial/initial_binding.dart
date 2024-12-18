import 'package:get/get.dart';

import 'inital_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InitialController>(InitialController());
  }
}

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

import '../../core/base/base_controller.dart';
import '../../data/source/local/local_storage.dart';
import '../../domain/service/user/user_service.dart';

class InitialController extends BaseController {
  final _storage = Get.find<LocalStorage>();
  final _userService = Get.find<UserService>();

  @override
  Future<void> onReady() async {
    await initData();
    // gotoHome();
    super.onReady();
  }

  Future<void> initData() async {
    mainProvider.isLoggedIn.value = _storage.accessToken?.isNotEmpty ?? false;

    if (mainProvider.isLoggedIn.isTrue) {
      // await getUserData();
    }
  }



  // Future<void> getUserData() async {
  //   final user = await _userService.getUserInfo();
  //   mainProvider.updateCurrentUser(user);
  // }

}

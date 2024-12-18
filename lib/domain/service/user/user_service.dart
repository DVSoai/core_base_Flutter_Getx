import 'package:get/get.dart';

import '../../../core/base/base_service.dart';
import '../../../data/repositories/user/user_repository.dart';

class UserService extends BaseService {
  final UserRepository _userRepository = Get.find<UserRepository>();
}
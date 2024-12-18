import 'package:get/get.dart';

import '../../../core/base/base_service.dart';
import '../../../data/repositories/auth/auth_repository.dart';
import '../../../data/source/local/local_storage.dart';
import '../../../provider/main_provider.dart';

class AuthService extends BaseService {
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final MainProvider _mainProvider = Get.find<MainProvider>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();
}
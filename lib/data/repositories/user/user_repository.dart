import '../../source/network/api_service.dart';

abstract class UserApiPath {
  static const String userMe = '/api/v1/users/me';
  static const String updateAvatar = '/api/v1/users/set-avatar';
}

abstract class UserRepository extends ApiServices {

}
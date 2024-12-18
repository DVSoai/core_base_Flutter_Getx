

import '../../data/source/network/result_dto.dart';
import 'base_exception.dart';

class BaseService {}

extension BaseServiceHttpRepository on BaseService {
  Exception handleError(Result result) {
    var error = result.error;
    return BaseNetworkException(error.message, code: error.code);
  }
}

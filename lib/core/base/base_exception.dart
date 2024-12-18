class BaseNetworkException implements Exception {
  String? message;
  String? code;
  BaseNetworkException(this.message, {this.code});
  @override
  String toString() {
    message = message!.isNotEmpty ? message : null;
    String messageSnackbar =
        message ?? errorMap[code] ?? 'Có lỗi xảy ra vui lòng thử lại';
    return messageSnackbar;
  }
}

Map<String, String> errorMap = {
  'AUTH.OTP_FAIL': 'Sai mã OTP, vui lòng thử lại!',
  'AUTH.USER_OR_EMAIL_NOT_CORRECT':
  'Sai thông tin đăng nhập, vui lòng thử lại!',
  'USER.OLD_PASSWORD_IS_NOT_VALID': 'Mật khẩu cũ không đúng!',
};

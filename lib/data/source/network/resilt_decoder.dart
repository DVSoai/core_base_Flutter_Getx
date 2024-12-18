import 'package:core_base_flutter/data/source/network/result_dto.dart';

typedef Decoder<T> = T Function(dynamic data);

class ResultDecoder<T> {
  final Result result;
  final Decoder decoder;

  ResultDecoder(
      this.result, {
        required this.decoder,
      });

  bool get success => result.success;

  bool get hasError => result.hasError;

  String get msg => result.msg ?? 'something went wrong decoder';

  String get code => result.errorCode ?? '-1';

  Errors? get error =>
      hasError ? Errors(result.errorCode ?? '-1', result.msg ?? 'something went wrong decoder') : null;

  T get modelDTO => decoded();

  T decoded() {
    try {
      if (result.data != null) {
        return decoder(result.data) as T;
      } else {
        throw UnsupportedError(
            'BaseDecoder Error=> ${T.runtimeType} data is null');
      }
    } on Exception catch (e) {
      throw UnsupportedError(
          'BaseDecoder Error=> ${T.runtimeType} ${e.toString()}');
    }
  }
}
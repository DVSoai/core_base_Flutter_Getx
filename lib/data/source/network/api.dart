// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:core_base_flutter/data/source/network/result_dto.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../core/constants/server_request_response_constant.dart';
import '../../../core/constants/server_timeout_constants.dart';
import '../local/local_storage.dart';

enum Method { GET, POST, DELETE, PUT, PATCH }

class Api extends GetConnect {
  final String backendUrl;
  final _storage = Get.find<LocalStorage>();
  final bool? requiredAuthorization;

  Api({required this.backendUrl, this.requiredAuthorization = true});

  @override
  String get baseUrl => backendUrl;

  String get authorization =>
      '${ServerRequestResponseConstants.bearer} ${_storage.accessToken}';

  String get language => _storage.locale.languageCode;

  @override
  void onInit() {
    httpClient.timeout = ServerTimeoutConstants.timeOut;
    httpClient.addRequestModifier<void>((request) async {
      // Config Header
      if (requiredAuthorization == true) {
        request.headers['Authorization'] = authorization;
        request.headers['x-language'] = language;
        // request.headers['Content-Type'] = 'application/json';
      }

      // For development
      if (kDebugMode) {
        log(request.headers.toString(), name: request.url.path);
      }
      return request;
    });
    super.onInit();
  }

  Future<Result> _handleResponse(
      Response? response, Method method, String endPoint,
      {dynamic params,
        required Future<Result> Function(
            {Method method, required String endPoint, dynamic params})
        onError}) async {
    if (response != null && response.isOk) {
      _requestOk(method, endPoint, params, response.bodyString);
      return Result.fromJson(response.bodyString!);
    } else {
      _requestException(
        method,
        endPoint,
        'PARSING ERROR',
        params: params,
        bodyString: response?.bodyString,
      );
      return onError(method: method, endPoint: endPoint, params: params);
    }
  }

  Future<Result> _makeRequest(
      {required Method method,
        required String endPoint,
        dynamic params,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Future<Response?> Function()? requestFunction}) async {
    Response? res;
    try {
      res = await requestFunction?.call().timeout(timeOut!);
      return _handleResponse(res, method, endPoint,
          params: params, onError: onServerError);
    } on TimeoutException catch (e) {
      _requestException(
        method,
        endPoint,
        'TimeOut',
        params: params,
        bodyString: res?.bodyString,
        exception: e.message,
      );
      return onTimeOut(endPoint: endPoint, params: params);
    } catch (e) {
      _requestException(
        method,
        endPoint,
        'ERROR',
        params: params,
        bodyString: res?.bodyString,
        exception: e.toString(),
      );
      return onServerError(endPoint: endPoint, params: params);
    }
  }

  /// FOR NETWORKING WITH [Method.GET]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> getData(
      {required String endPoint,
        Map<String, dynamic>? params,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Map<String, String>? headers,
        bool retry = false}) async {
    return _makeRequest(
        method: Method.GET,
        endPoint: endPoint,
        params: params,
        timeOut: timeOut,
        requestFunction: () =>
            httpClient.get(endPoint, headers: headers, query: params));
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData(
      {required String endPoint,
        dynamic params,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Map<String, String>? headers,
        bool retry = false}) async {
    return _makeRequest(
        method: Method.POST,
        endPoint: endPoint,
        params: params,
        timeOut: timeOut,
        requestFunction: () =>
            httpClient.post(endPoint, headers: headers, body: params));
  }

  /// FOR NETWORKING WITH [Method.PATCH]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> patchData(
      {required String endPoint,
        dynamic params,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Map<String, String>? headers,
        bool retry = false}) async {
    return _makeRequest(
        method: Method.PATCH,
        endPoint: endPoint,
        params: params,
        timeOut: timeOut,
        requestFunction: () =>
            httpClient.patch(endPoint, headers: headers, body: params));
  }

  /// FOR NETWORKING WITH [Method.PUT]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> putData(
      {required String endPoint,
        dynamic params,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Map<String, String>? headers,
        bool retry = false}) async {
    return _makeRequest(
        method: Method.PUT,
        endPoint: endPoint,
        params: params,
        timeOut: timeOut,
        requestFunction: () =>
            httpClient.put(endPoint, headers: headers, body: params));
  }

  /// FOR NETWORKING WITH [Method.DELETE]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> deleteData(
      {required String endPoint,
        Duration? timeOut = ServerTimeoutConstants.timeOut,
        Map<String, dynamic>? params,
        Map<String, String>? headers,
        bool retry = false}) async {
    return _makeRequest(
        method: Method.DELETE,
        endPoint: endPoint,
        params: params,
        timeOut: timeOut,
        requestFunction: () =>
            httpClient.delete(endPoint, headers: headers, query: params));
  }

  // For development
  _requestException(
      Method method,
      String endPoint,
      String status, {
        String? exception,
        String? bodyString,
        dynamic params,
      }) {
    if (kDebugMode) {
      final fullUrl = baseUrl + endPoint;
      log('$method: $fullUrl Params: $params', name: 'API');
      log('$status => $exception', name: 'API');
      log('Response => $bodyString', name: 'API');
    }
  }

  // For development
  _requestOk(Method method, String endpoint, dynamic params, dynamic response) {
    if (kDebugMode) {
      log('request ok');
      final fullUrl = baseUrl + endpoint;
      log('$method: $fullUrl Params: $params', name: 'API');
      try {
        const JsonDecoder decoder = JsonDecoder();
        const JsonEncoder encoder = JsonEncoder.withIndent(' ');
        final object = decoder.convert(response as String);
        log('Response => ${encoder.convert(object)}', name: 'API');
      } catch (e) {
        log(response.toString(), name: 'API');
      }
    }
  }

  Future<Result> onTimeOut(
      {Method method = Method.GET,
        required String endPoint,
        dynamic params}) async {
    return Result(
        msg: tr("Có lỗi xảy ra, vui lòng thử lại sau."),
        success: false,
        errorCode: 'SERVER_FAULT_CODE');
  }

  Future<Result> onServerError(
      {Method method = Method.GET,
        required String endPoint,
        dynamic params}) async {
    return Result(
        msg: tr("Có lỗi xảy ra, vui lòng thử lại sau."),
        success: false,
        errorCode: 'SERVER_FAULT_CODE');
  }
}

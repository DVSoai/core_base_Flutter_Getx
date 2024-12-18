import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'result_dto.g.dart';

@JsonSerializable()
class Result {
  Result(
      {this.success = false, this.errorCode, this.msg, this.data, this.meta});

  final bool success;
  final String? errorCode;
  final dynamic data;
  final Meta? meta;

  @JsonKey(name: 'message')
  final String? msg;

  bool get hasError => !success && errorCode != null;

  Errors get error => errorCode != null
      ? Errors(
    errorCode!,
    msg ?? 'Something went wrong result',
  )
      : const Errors('-1', 'Un know error');

  factory Result.fromJson(String json) =>
      _$ResultFromJson(jsonDecode(json) as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

class Errors {
  final String code;
  final String message;

  const Errors(this.code, this.message);

  factory Errors.nullValue() => const Errors('-1', 'Un know error');

  factory Errors.serverError() => const Errors('500', 'Server Error');
}

@JsonSerializable()
class Meta {
  int? totalItems;
  int? pageSize;
  int? currentPage;
  int? totalPages;
  int? notifyUnreadPersonalCount;
  int? notifyUnreadDeptCount;
  int? notifyUnreadCompanyCount;
  int? notifyUnreadGlobalCount;

  Meta(
      {this.totalItems,
        this.pageSize,
        this.currentPage,
        this.totalPages,
        this.notifyUnreadPersonalCount,
        this.notifyUnreadDeptCount,
        this.notifyUnreadCompanyCount,
        this.notifyUnreadGlobalCount});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

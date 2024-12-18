// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      success: json['success'] as bool? ?? false,
      errorCode: json['errorCode'] as String?,
      msg: json['message'] as String?,
      data: json['data'],
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'success': instance.success,
      'errorCode': instance.errorCode,
      'data': instance.data,
      'meta': instance.meta,
      'message': instance.msg,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      totalItems: (json['totalItems'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
      notifyUnreadPersonalCount:
          (json['notifyUnreadPersonalCount'] as num?)?.toInt(),
      notifyUnreadDeptCount: (json['notifyUnreadDeptCount'] as num?)?.toInt(),
      notifyUnreadCompanyCount:
          (json['notifyUnreadCompanyCount'] as num?)?.toInt(),
      notifyUnreadGlobalCount:
          (json['notifyUnreadGlobalCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'totalItems': instance.totalItems,
      'pageSize': instance.pageSize,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'notifyUnreadPersonalCount': instance.notifyUnreadPersonalCount,
      'notifyUnreadDeptCount': instance.notifyUnreadDeptCount,
      'notifyUnreadCompanyCount': instance.notifyUnreadCompanyCount,
      'notifyUnreadGlobalCount': instance.notifyUnreadGlobalCount,
    };

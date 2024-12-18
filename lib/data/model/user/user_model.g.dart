// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      isVerified: json['isVerified'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      role: json['role'] as String?,
      profileId: (json['profileId'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      createdById: (json['createdById'] as num?)?.toInt(),
      updatedById: (json['updatedById'] as num?)?.toInt(),
      deletedById: (json['deletedById'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'isVerified': instance.isVerified,
      'status': instance.status,
      'role': instance.role,
      'profileId': instance.profileId,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'gender': instance.gender,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'createdById': instance.createdById,
      'updatedById': instance.updatedById,
      'deletedById': instance.deletedById,
    };

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? id;
  String? fullName;
  String? email;
  bool? isVerified;
  int? status;
  String? role;
  int? profileId;
  String? avatar;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? createdById;
  int? updatedById;
  int? deletedById;

  UserModel(
      {this.id,
        this.fullName,
        this.email,
        this.isVerified,
        this.status,
        this.role,
        this.profileId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.createdById,
        this.updatedById,
        this.deletedById,
        this.avatar,
        this.phone,
        this.gender});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

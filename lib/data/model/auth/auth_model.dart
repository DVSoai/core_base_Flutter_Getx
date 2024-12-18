import 'package:json_annotation/json_annotation.dart';

import '../user/user_model.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  String? accessToken;
  String? refreshToken;
  @JsonKey(name: 'isVerified')
  bool? isAccountVerified;
  UserModel? user;

  AuthModel({
    this.accessToken,
    this.refreshToken,
    this.user,
    this.isAccountVerified,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

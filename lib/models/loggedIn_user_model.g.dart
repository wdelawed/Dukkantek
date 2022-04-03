// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loggedIn_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoggedInUserModel _$LoggedInUserModelFromJson(Map<String, dynamic> json) {
  return LoggedInUserModel(
    json['token'] as String,
    json['user_display_name'] as String,
    json['user_email'] as String,
    int.parse(json['user_id']),
    tokenExpiry: json['tokenExpiry'] as String,
  );
}

Map<String, dynamic> _$LoggedInUserModelToJson(LoggedInUserModel instance) =>
    <String, dynamic>{
      'user_email': instance.user_email,
      'token': instance.token,
      'user_display_name': instance.username,
      'tokenExpiry': instance.tokenExpiry,
      'user_id': instance.user_id,
    };

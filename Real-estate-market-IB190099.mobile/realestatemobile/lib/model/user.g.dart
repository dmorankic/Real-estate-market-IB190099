// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['id'] as int?
  ..firstName = json['firstName'] as String?
  ..userName = json['userName'] as String?
  ..lastName = json['lastName'] as String?
  ..email = json['email'] as String?
  ..phone = json['phone'] as String?
  ..dateOfBirth = json['dateOfBirth'] == null
      ? null
      : DateTime.parse(json['dateOfBirth'] as String)
  ..dateRegistered = json['dateRegistered'] == null
      ? null
      : DateTime.parse(json['dateRegistered'] as String)
  ..gender = json['gender'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'userName': instance.userName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'dateRegistered': instance.dateRegistered?.toIso8601String(),
      'gender': instance.gender,
    };

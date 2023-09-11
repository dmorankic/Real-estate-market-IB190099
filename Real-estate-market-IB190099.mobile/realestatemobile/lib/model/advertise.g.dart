// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advertise _$AdvertiseFromJson(Map<String, dynamic> json) => Advertise()
  ..id = json['id'] as int?
  ..status = json['status'] as String?
  ..type = json['type'] as String?
  ..propertyId = json['propertyId'] as int?
  ..userId = json['userId'] as int?
  ..dateCreated = json['dateCreated'] == null
      ? null
      : DateTime.parse(json['dateCreated'] as String)
  ..property = json['property'] == null
      ? null
      : Property.fromJson(json['property'] as Map<String, dynamic>)
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..employeeId = json['employeeId'] as int?;

Map<String, dynamic> _$AdvertiseToJson(Advertise instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'propertyId': instance.propertyId,
      'userId': instance.userId,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'property': instance.property,
      'user': instance.user,
      'employeeId': instance.employeeId,
    };

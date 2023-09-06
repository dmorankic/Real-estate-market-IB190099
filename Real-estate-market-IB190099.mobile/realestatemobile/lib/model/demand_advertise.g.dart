// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demand_advertise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemandAdvertise _$DemandAdvertiseFromJson(Map<String, dynamic> json) =>
    DemandAdvertise()
      ..id = json['id'] as int?
      ..status = json['status'] as String?
      ..type = json['type'] as String?
      ..description = json['description'] as String?
      ..minQuadrature = (json['minQuadrature'] as num?)?.toDouble()
      ..location = json['location'] as String?
      ..maxQuadrature = (json['maxQuadrature'] as num?)?.toDouble()
      ..floors = json['floors'] as int?
      ..propertyType = json['propertyType'] as String?
      ..rooms = json['rooms'] as int?
      ..parking = json['parking'] as int?
      ..water = json['water'] as int?
      ..electricity = json['electricity'] as int?
      ..userId = json['userId'] as int?
      ..dateCreated = json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String)
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$DemandAdvertiseToJson(DemandAdvertise instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'description': instance.description,
      'minQuadrature': instance.minQuadrature,
      'location': instance.location,
      'maxQuadrature': instance.maxQuadrature,
      'floors': instance.floors,
      'propertyType': instance.propertyType,
      'rooms': instance.rooms,
      'parking': instance.parking,
      'water': instance.water,
      'electricity': instance.electricity,
      'userId': instance.userId,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'user': instance.user,
    };

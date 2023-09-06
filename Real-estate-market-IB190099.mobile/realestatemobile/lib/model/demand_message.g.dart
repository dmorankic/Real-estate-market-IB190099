// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demand_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemandMessage _$DemandMessageFromJson(Map<String, dynamic> json) =>
    DemandMessage()
      ..id = json['id'] as int?
      ..content = json['content'] as String?
      ..sender = json['sender'] == null
          ? null
          : User.fromJson(json['sender'] as Map<String, dynamic>)
      ..senderId = json['senderId'] as int?
      ..timestamp = json['timestamp']
      ..demandAdvertise = json['demandAdvertise'] == null
          ? null
          : DemandAdvertise.fromJson(
              json['demandAdvertise'] as Map<String, dynamic>)
      ..demandAdvertiseId = json['demandAdvertiseId'] as int?
      ..isEmployee = json['isEmployee'] as int?;

Map<String, dynamic> _$DemandMessageToJson(DemandMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sender': instance.sender,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp,
      'demandAdvertise': instance.demandAdvertise,
      'demandAdvertiseId': instance.demandAdvertiseId,
      'isEmployee': instance.isEmployee,
    };

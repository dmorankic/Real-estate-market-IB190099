// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message()
  ..id = json['id'] as int?
  ..content = json['content'] as String?
  ..sender = json['sender'] == null
      ? null
      : User.fromJson(json['sender'] as Map<String, dynamic>)
  ..senderId = json['senderId'] as int?
  ..timestamp = json['timestamp']
  ..advertise = json['advertise'] == null
      ? null
      : Advertise.fromJson(json['advertise'] as Map<String, dynamic>)
  ..advertiseId = json['advertiseId'] as int?
  ..isEmployee = json['isEmployee'] as int?;

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'sender': instance.sender,
      'senderId': instance.senderId,
      'timestamp': instance.timestamp,
      'advertise': instance.advertise,
      'advertiseId': instance.advertiseId,
      'isEmployee': instance.isEmployee
    };

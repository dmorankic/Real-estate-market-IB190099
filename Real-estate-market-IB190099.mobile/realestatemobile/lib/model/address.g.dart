// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address()
  ..id = json['id'] as int?
  ..numberStreet = json['numberStreet'] as String?
  ..city = json['city'] == null
      ? null
      : City.fromJson(json['city'] as Map<String, dynamic>);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'numberStreet': instance.numberStreet,
      'city': instance.city,
    };

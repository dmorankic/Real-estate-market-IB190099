// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property()
  ..id = json['id'] as int?
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..floors = json['floors'] as int?
  ..propertyType = json['propertyType'] as String?
  ..rooms = json['rooms'] as int?
  ..yearOfConstruction = json['yearOfConstruction'] as int?
  ..parking = json['parking'] as int?
  ..water = json['water'] as int?
  ..electricity = json['electricity'] as int?
  ..price = json['price'] as int?
  ..addressId = json['addressId'] as int?
  ..quadrature = (json['quadrature'] as num?)?.toDouble()
  ..locationId = json['locationId'] as int?
  ..images = (json['images'] as List<dynamic>?)
      ?.map((e) => LocalImage.fromJson(e).imageUrl as String)
      .toList()
  ..address = json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>)
  ..location = json['location'] == null
      ? null
      : Location.fromJson(json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'floors': instance.floors,
      'propertyType': instance.propertyType,
      'rooms': instance.rooms,
      'yearOfConstruction': instance.yearOfConstruction,
      'parking': instance.parking,
      'water': instance.water,
      'electricity': instance.electricity,
      'price': instance.price,
      'addressId': instance.addressId,
      'quadrature': instance.quadrature,
      'locationId': instance.locationId,
      'images': instance.images,
      'address': instance.address,
      'location': instance.location,
    };

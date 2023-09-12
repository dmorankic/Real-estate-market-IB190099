// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating()
  ..id = json['id'] as int?
  ..propertyId = json['propertyId'] as int?
  ..userId = json['userId'] as String?
  ..rating1 = (json['rating1'] as num?)?.toDouble();

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'propertyId': instance.propertyId,
      'userId': instance.userId,
      'rating1': instance.rating1
    };

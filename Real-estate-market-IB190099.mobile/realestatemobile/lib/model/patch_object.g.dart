// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchObject _$PatchObjectFromJson(Map<String, dynamic> json) => PatchObject(
      path: json['path'] as String?,
      op: json['op'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$PatchObjectToJson(PatchObject instance) =>
    <String, dynamic>{
      'path': instance.path,
      'op': instance.op,
      'value': instance.value,
    };

// ignore_for_file: non_constant_identifier_names

import 'dart:core';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'patch_object.g.dart';

@JsonSerializable()
class PatchObject {
  String? path;
  String? op;
  Object? value;

  PatchObject({required this.path, required this.op, required this.value});

  factory PatchObject.fromJson(Map<String, dynamic> json) =>
      _$PatchObjectFromJson(json);

  /// Connect the generated [_$PatchObjectToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PatchObjectToJson(this);
}

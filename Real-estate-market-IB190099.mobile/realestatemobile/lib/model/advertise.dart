// ignore_for_file: non_constant_identifier_names

import 'dart:core';
import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:realestatemobile/model/property.dart';
import 'package:realestatemobile/model/user.dart';

part 'advertise.g.dart';

@JsonSerializable()
class Advertise {
  Advertise() {}
  int? id;
  String? status;
  String? type;
  int? propertyId;
  int? userId;
  DateTime? dateCreated;
  Property? property;
  User? user;
  int? employeeId;

  factory Advertise.fromJson(Map<String, dynamic> json) =>
      _$AdvertiseFromJson(json);

  /// Connect the generated [_$AdvertiseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AdvertiseToJson(this);
}

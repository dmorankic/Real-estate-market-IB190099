// ignore_for_file: non_constant_identifier_names

import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import 'package:realestatemobile/model/user.dart';

part 'demand_advertise.g.dart';

@JsonSerializable()
class DemandAdvertise {
  DemandAdvertise() {}
  int? id;
  String? status;
  String? type;
  String? description;
  double? minQuadrature;
  String? location;
  double? maxQuadrature;
  int? floors;
  String? propertyType;
  int? rooms;
  int? parking;
  int? water;
  int? electricity;
  int? userId;
  DateTime? dateCreated;
  User? user;

  factory DemandAdvertise.fromJson(Map<String, dynamic> json) =>
      _$DemandAdvertiseFromJson(json);

  /// Connect the generated [_$DemandAdvertiseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DemandAdvertiseToJson(this);
}

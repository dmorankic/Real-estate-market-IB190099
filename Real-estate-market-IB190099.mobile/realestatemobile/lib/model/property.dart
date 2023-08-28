// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:realestatemobile/model/image.dart';
import 'package:realestatemobile/model/location.dart';

import 'address.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  Property() {}

  int? id;
  String? name;
  String? description;
  int? floors;
  String? propertyType;
  int? rooms;
  int? yearOfConstruction;
  int? parking;
  int? water;
  int? electricity;
  int? price;
  int? addressId;
  double? quadrature;
  int? locationId;
  List<String>? images;
  Address? address;
  Location? location;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

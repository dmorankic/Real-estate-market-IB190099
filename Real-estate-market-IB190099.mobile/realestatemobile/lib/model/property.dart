// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

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
  String? yearOfConstruction;
  int? parking;
  int? water;
  int? electricity;
  int? price;
  int? addressId;
  double? quadrature;
  int? locationId;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

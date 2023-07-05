// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:realestatemobile/model/city.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Address() {}

  int? id;
  String? numberStreet;
  City? city;
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Connect the generated [_$AddressToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

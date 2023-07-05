// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  City() {}

  int? id;
  String? name;
  String? zipCode;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  /// Connect the generated [_$CityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CityToJson(this);
}

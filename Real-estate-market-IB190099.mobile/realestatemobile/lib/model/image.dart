// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  Image() {}
  String? Image1;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  /// Connect the generated [_$ImageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

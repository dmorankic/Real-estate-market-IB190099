// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class LocalImage {
  LocalImage();
  int? id;
  String? imageUrl;

  factory LocalImage.fromJson(Map<String, dynamic> json) =>
      _$LocalImageFromJson(json);

  /// Connect the generated [_$LocalImageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocalImageToJson(this);
}

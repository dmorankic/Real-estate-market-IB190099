// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating {
  Rating() {}

  int? id;
  int? propertyId;
  String? userId;
  double? rating1;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  /// Connect the generated [_$RatingToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

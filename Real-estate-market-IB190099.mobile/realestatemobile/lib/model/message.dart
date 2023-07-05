import 'package:realestatemobile/model/user.dart';
// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'advertise.dart';
part 'message.g.dart';

@JsonSerializable()
class Message {
  String? id;
  String? content;
  User? sender;
  String? senderId;
  Object? timestamp;
  Advertise? advertise;
  String? advertiseId;

  Message() {}

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// Connect the generated [_$MessageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

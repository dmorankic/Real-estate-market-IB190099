import 'package:realestatemobile/model/user.dart';
// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'demand_advertise.dart';
part 'demand_message.g.dart';

@JsonSerializable()
class DemandMessage {
  int? id;
  String? content;
  User? sender;
  int? senderId;
  Object? timestamp;
  DemandAdvertise? demandAdvertise;
  int? demandAdvertiseId;
  int? isEmployee;

  DemandMessage() {}

  factory DemandMessage.fromJson(Map<String, dynamic> json) =>
      _$DemandMessageFromJson(json);

  /// Connect the generated [_$DemandMessageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DemandMessageToJson(this);
}

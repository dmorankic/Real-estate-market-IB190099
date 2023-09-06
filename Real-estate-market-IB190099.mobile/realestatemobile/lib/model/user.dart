import 'package:json_annotation/json_annotation.dart';
import 'package:realestatemobile/model/address.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? firstName;
  String? username;
  String? lastName;
  String? email;
  String? phone;
  DateTime? dateOfBirth;
  DateTime? dateRegistered;
  String? gender;
  List<int>? savedAdvertisesIds;
  List<int>? savedDemandAdvertisesIds;

  Address? address;
  User() {}

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$UserToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment {
  City() {}

  int? id;
  double? amount;
  DateTime? transactionDate;
  Payment() {}
  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  /// Connect the generated [_$PaymentToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}

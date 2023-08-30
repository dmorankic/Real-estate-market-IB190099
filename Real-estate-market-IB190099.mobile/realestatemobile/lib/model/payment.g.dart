// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment()
  ..id = json['id'] as int?
  ..amount = (json['amount'] as num?)?.toDouble()
  ..transactionDate = json['transactionDate'] == null
      ? null
      : DateTime.parse(json['transactionDate'] as String);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'transactionDate': instance.transactionDate?.toIso8601String(),
    };

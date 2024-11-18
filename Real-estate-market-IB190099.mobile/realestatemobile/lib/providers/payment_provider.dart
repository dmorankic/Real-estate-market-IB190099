import 'dart:convert';
import 'package:http/http.dart';
import 'package:realestatemobile/utils/util.dart';
import '../model/payment.dart';
import 'base_provider.dart';

class PaymentProvider extends BaseProvider<Payment> {
  PaymentProvider() : super("Payment");

  @override
  Payment fromJson(data) {
    return Payment.fromJson(data);
  }

  Future<Response> create(Map<String, dynamic> body) async {
    var url = "${GlobalVars.baseUrl}Payment";
    Map<String, String> headers = createHeaders();
    var uri = Uri.parse(url);
    var response =
        await http!.post(uri, headers: headers, body: jsonEncode(body));

    if (isValidResponseCode(response)) {
      return response;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart';

import '../model/demand_message.dart';
import 'base_provider.dart';

class DemandMessageProvider extends BaseProvider<DemandMessage> {
  DemandMessageProvider() : super("DemandMessage");
  static String baseUrl = "http://10.0.2.2:7006/";

  @override
  DemandMessage fromJson(data) {
    return DemandMessage.fromJson(data);
  }

  Future<Response> send(Map<String, String> body) async {
    var url = "${baseUrl}DemandMessage";
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

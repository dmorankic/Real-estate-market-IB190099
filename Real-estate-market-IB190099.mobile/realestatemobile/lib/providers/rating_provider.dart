import 'dart:convert';

import 'package:http/http.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/rating.dart';
import 'base_provider.dart';

class RatingProvider extends BaseProvider<Rating> {
  RatingProvider() : super("Rating");


  @override
  Rating fromJson(data) {
    return Rating.fromJson(data);
  }

  Future<Response> rate(Map<String, dynamic> body) async {
    var url = "${GlobalVars.baseUrl}Rating";
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

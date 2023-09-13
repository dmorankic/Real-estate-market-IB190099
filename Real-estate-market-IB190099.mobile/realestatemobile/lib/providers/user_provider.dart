import 'dart:convert';

import 'package:http/http.dart';
import 'package:realestatemobile/model/patch_object.dart';

import '../model/user.dart';
import 'base_provider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super("User");
  static String baseUrl = "http://10.0.2.2:7006/";

  @override
  User fromJson(data) {
    return User.fromJson(data);
  }

  Future<Response> register(Map<String, String> body) async {
    var url = "${baseUrl}User";
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

  Future<Response> update(List<PatchObject> updateReq, int userId) async {
    var url = "${baseUrl}User/${userId}";
    Map<String, String> headers = createHeaders();
    var uri = Uri.parse(url);
    var response =
        await http!.patch(uri, headers: headers, body: jsonEncode(updateReq));

    if (isValidResponseCode(response)) {
      return response;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Future<Response> updateAddress(Map<String, String> body, int userId) async {
    var url = "${baseUrl}User/${userId}";
    Map<String, String> headers = createHeaders();
    var uri = Uri.parse(url);
    var response =
        await http!.put(uri, headers: headers, body: jsonEncode(body));

    if (isValidResponseCode(response)) {
      return response;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }
}

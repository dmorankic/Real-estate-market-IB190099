// ignore_for_file: unnecessary_new, unused_local_variable, unused_import, prefer_final_fields

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:realestatemobile/model/advertise.dart';
import 'dart:io';
import 'dart:async';

import 'package:realestatemobile/screens/rent.dart';
import 'package:realestatemobile/utils/util.dart';

import '../model/demand_advertise.dart';
import 'base_provider.dart';

class DemandAdvertiseProvider extends BaseProvider<DemandAdvertise> {
  DemandAdvertiseProvider() : super("DemandAdvertise");
  static String _baseUrl = "https://10.0.2.2:7006/";
  @override
  DemandAdvertise fromJson(data) {
    return DemandAdvertise.fromJson(data);
  }

  Future<List<DemandAdvertise>> getSaved(String endpoint) async {
    var url = "$_baseUrl$endpoint";
    Map<String, String> headers = createHeaders();

    var uri = Uri.parse(url);

    var response = await http!.get(uri, headers: headers);
    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      data = data.map((x) => fromJson(x)).cast<DemandAdvertise>().toList();
      return data;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Future<Response> removeFromSaved(String advertiseId, String endpoint) async {
    var url = "$_baseUrl$endpoint";
    Map<String, String> headers = createHeaders();
    var uri = Uri.parse(url);
    var response = await http!.delete(uri,
        headers: headers,
        body: jsonEncode(<String, String>{
          "userId": Authorization.loggedUser!.id.toString(),
          "advertiseId": advertiseId
        }));

    if (isValidResponseCode(response)) {
      return response;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Future<Response> createAdvertise(Map<String, dynamic> body) async {
    var url = "${_baseUrl}DemandAdvertise";
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

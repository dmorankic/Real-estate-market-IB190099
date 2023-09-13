// ignore_for_file: unnecessary_new, unused_local_variable, unused_import

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:realestatemobile/model/advertise.dart';
import 'dart:io';
import 'dart:async';
import 'package:realestatemobile/screens/rent.dart';

import '../utils/util.dart';

abstract class BaseProvider<T> with ChangeNotifier {
  static String? _baseUrl;
  static String? _endpoint;

  HttpClient client = new HttpClient();
  IOClient? http;

  BaseProvider(String endpoint) {
    _baseUrl = const String.fromEnvironment("baseUrl",
        defaultValue: "http://10.0.2.2:7006/");

    if (_baseUrl!.endsWith("/") == false) {
      _baseUrl = _baseUrl! + "/";
    }

    _endpoint = endpoint;
    client.badCertificateCallback = (cert, host, port) => true;
    http = IOClient(client);
  }

  Future<List<T>> get(dynamic search, String endpoint) async {
    var url = "$_baseUrl$endpoint";
    Map<String, String> headers = createHeaders();

    if (search != null) {
      String queryString = getQueryString(search);
      url = url + "?" + queryString;
    }
    var uri = Uri.parse(url);

    var response = await http!.get(uri, headers: headers);
    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      data = data.map((x) => fromJson(x)).cast<T>().toList();
      return data;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Future<T> getById(String id, String endpoint) async {
    var url = "$_baseUrl$endpoint/${id}";
    Map<String, String> headers = createHeaders();

    var uri = Uri.parse(url);
    var response = await http!.get(uri, headers: headers);

    if (isValidResponseCode(response)) {
      var data = jsonDecode(response.body);
      var mappedData = fromJson(data);
      return mappedData;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Future<Response> saveAd(String advertiseId, String endpoint) async {
    var url = "${_baseUrl}${endpoint}/Save";
    Map<String, String> headers = createHeaders();
    var uri = Uri.parse(url);
    var response = await http!.post(uri,
        headers: headers,
        body: jsonEncode(<String, String>{
          "userId": Authorization.loggedUser!.id.toString(),
          "${endpoint}Id": advertiseId
        }));

    if (isValidResponseCode(response)) {
      return response;
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  Map<String, String> createHeaders() {
    String? username = Authorization.username;
    String? password = Authorization.password;

    String basicAuth =
        "Basic ${base64Encode(utf8.encode('$username:$password'))}";

    var headers = {
      "Content-Type": "application/json",
      "Authorization": basicAuth
    };
    return headers;
  }

  T fromJson(data) {
    throw Exception("Override method");
  }

  bool isValidResponseCode(Response response) {
    if (response.statusCode == 200) {
      if (response.body != "") {
        return true;
      } else {
        return false;
      }
    } else if (response.statusCode == 204) {
      return true;
    } else if (response.statusCode == 400) {
      var message = response.body.substring(11, response.body.length - 3);
      throw Exception(message);
    } else if (response.statusCode == 401) {
      throw Exception("Unauthorized");
    } else if (response.statusCode == 403) {
      throw Exception("Forbidden");
    } else if (response.statusCode == 404) {
      throw Exception("Not found");
    } else if (response.statusCode == 500) {
      throw Exception("Internal server error");
    } else {
      throw Exception("Exception... handle this gracefully");
    }
  }

  String getQueryString(Map params,
      {String prefix = '&', bool inRecursion = false}) {
    String query = '';
    params.forEach((key, value) {
      if (inRecursion) {
        if (key is int) {
          key = '[$key]';
        } else if (value is List || value is Map) {
          key = '.$key';
        } else {
          key = '.$key';
        }
      }
      if (value is String || value is int || value is double || value is bool) {
        var encoded = value;
        if (value is String) {
          encoded = Uri.encodeComponent(value);
        }
        query += '$prefix$key=$encoded';
      } else if (value is DateTime) {
        query += '$prefix$key=${(value as DateTime).toIso8601String()}';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    return query;
  }
}

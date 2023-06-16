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

import 'base_provider.dart';

class AdvertiseProvider extends BaseProvider<Advertise> {
  AdvertiseProvider() : super("Advertise");

  @override
  Advertise fromJson(data) {
    return Advertise.fromJson(data);
  }
}

// class AdvertiseProvider with ChangeNotifier {
//   HttpClient client = new HttpClient();
//   IOClient? http;
//   AdvertiseProvider() {
//     client.badCertificateCallback = (cert, host, port) => true;
//     http = IOClient(client);
//   }

//   Future<List<Advertise>> get(dynamic searchObject) async {
//     var url =
//         Uri.parse("https://10.0.2.2:7006/Advertise?Type=${searchObject.type}");
//     String username = "admin";
//     String password = "admin";
//     String basicAuth =
//         "Basic ${base64Encode(utf8.encode('$username:$password'))}";
//     var headers = {
//       "Content-Type": "application/json",
//       "Authorization": basicAuth
//     };
//     var response = await http!.get(url, headers: headers);
//     if (response.statusCode < 400) {
//       //print("${response.statusCode}  ${response.body}");
//       var data = jsonDecode(response.body);
//       List<Advertise> mappedData =
//           data.map((x) => Advertise.fromJson(x)).cast<Advertise>().toList();
//       return mappedData;
//     } else {
//       print("${response.statusCode}  ${response.body}");
//       throw Exception("${response.statusCode}  ${response.body}");
//     }
//   }
// }

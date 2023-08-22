// ignore_for_file: library_prefixes

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpClient;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:image_picker/image_picker.dart';
import '../model/image.dart';
// import 'package:http/http.dart' as httpClient;
import '../utils/util.dart';
import 'base_provider.dart';

class LocalImageProvider extends BaseProvider<Image> {
  LocalImageProvider() : super("Image") {
    //httpClient.badCertificateCallback = (cert, host, port) => true;
    //http = IOClient(client);
  }
  static String baseUrl = "https://10.0.2.2:7006/";

  //HttpClient client = new HttpClient();
  //IOClient http;
  @override
  Image fromJson(data) {
    return Image.fromJson(data);
  }

  Future<Response> upload(Map<String, String> body) async {
    var url = "${baseUrl}Image";
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

  Future sendImage(XFile? media) async {
    var uri = "https://10.0.2.2:7006/Image/UploadImage";

    var request = httpClient.MultipartRequest('POST', Uri.parse(uri));

    if (media != null) {
      var pic = await httpClient.MultipartFile.fromPath("image", media.path);

      request.files.add(pic);

      await request.send().then((result) async {
        await httpClient.Response.fromStream(result).then((response) {
          return response;
        });
      });
    }
  }

  Future<Response> getImageFromServer() async {
    return httpClient.get(Uri.parse('https://10.0.2.2:7006/Image'));
  }

  Future<String> uploadImage(String filePath) async {
    var uri = "https://10.0.2.2:7006/Image/UploadImage";
    httpClient.MultipartRequest request =
        httpClient.MultipartRequest("POST", Uri.parse(uri));

    httpClient.MultipartFile multipartFile =
        await httpClient.MultipartFile.fromPath('file', filePath);

    request.files.add(multipartFile);
    String? username = Authorization.username;
    String? password = Authorization.password;

    String basicAuth =
        "Basic ${base64Encode(utf8.encode('$username:$password'))}";
    var headers = {
      "content-type": "multipart/form-data",
      "Authorization": basicAuth
    };

    request.headers.addAll(headers);

    var response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      return responseString;
    } else {
      return "null";
    }
  }
}

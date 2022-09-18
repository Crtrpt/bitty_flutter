import 'dart:convert';
import 'dart:io';

import 'package:bitty/config.dart';
import 'package:http/http.dart' as http;

class Api {
  static String host = "http://192.168.1.8:9081/api/v1/";
  static String assetHost = "http://192.168.1.8:9081/api/v1/";
  static const dynamic defaultBody = {};
  static Map<String, String> defaultHeader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    HttpHeaders.hostHeader: "192.168.1.8"
  };

  static Future<dynamic> get(
    String path,
  ) async {
    var uri = host + path;
    var response = await http.get(Uri.parse(uri), headers: Api.defaultHeader);
    if (response.statusCode == 200) {
      return Future.value(jsonDecode(response.body));
    } else {
      return Future.error(
          "网络异常: " + response.statusCode.toString() + " GET " + uri);
    }
  }

  static Future<dynamic> upload(String path, File file,
      {Map<String, String> headers = const {}}) async {
    var uri = assetHost + path;
    var h = (new Map<String, String>.from(Api.defaultHeader));

    h.putIfAbsent("version", () => Config.version);
    h.putIfAbsent("platform", () => Config.platform);
    h.remove(HttpHeaders.contentTypeHeader);
    h.putIfAbsent(HttpHeaders.contentTypeHeader,
        () => "multipart/form-data; boundary=something");
    print("body================");

    var request = http.MultipartRequest("POST", Uri.parse(uri));
    request.headers.addAll(h);
    request.files.add(http.MultipartFile(
        'file', file.readAsBytes().asStream(), file.lengthSync(),
        filename: file.path.split('/').last));
    print("发送==============");
    var response = await request.send();
    var res = await http.Response.fromStream(response);
    if (res.statusCode == 200) {
      return Future.value(jsonDecode(res.body));
    } else {
      return Future.error(
          "网络异常: " + res.statusCode.toString() + " POST " + uri);
    }
  }

  static Future<dynamic> post(String path,
      {dynamic body = Api.defaultBody,
      Map<String, String> headers = const {}}) async {
    var uri = host + path;
    var strbody = json.encode(body);
    var h = (new Map<String, String>.from(Api.defaultHeader));

    h.putIfAbsent("version", () => Config.version);
    h.putIfAbsent("platform", () => Config.platform);

    var response = await http.post(
      Uri.parse(uri),
      headers: h,
      body: strbody,
    );
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      print(res);
      return Future.value(res);
    } else {
      return Future.error("网络异常: " +
          response.statusCode.toString() +
          " POST " +
          uri +
          " body:" +
          strbody +
          " raw:" +
          response.body);
    }
  }
}

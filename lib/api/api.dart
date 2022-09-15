import 'dart:convert';
import 'dart:io';

import 'package:bitty/config.dart';
import 'package:http/http.dart' as http;

class Api {
  static String host = "http://192.168.1.8:9081/api/v1/";
  static const Object defaultBody = {};
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

  static Future<dynamic> post(String path,
      {Object body = Api.defaultBody,
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

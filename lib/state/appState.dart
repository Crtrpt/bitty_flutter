import 'dart:convert';

import 'package:dino/page/auth/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';

class AppState {
  bool IsLogin = false;
  String token = "";

  SharedPreferences? prefs;

  Init() async {
    try {
      this.prefs = await SharedPreferences.getInstance();
      var content = prefs!.getString("store");
      if (content != null) {
        fromJson(jsonDecode(content));
      }
    } catch (e) {
      print("ERROR--------------" + e.toString());
      WidgetsFlutterBinding.ensureInitialized();
      return 0;
    }
  }

  save() {
    var content = jsonEncode(this);
    print(content);
    if (content != null) {
      this.prefs?.setString("store", content);
    }
  }

  Future<bool> Login(Loginform payload) async {
    print("登陆======");
    print(payload);
    var res = await Api.post("/api/v1/auth/login", body: payload);
    if (res["code"] == 0) {
      IsLogin = true;
      token = res['data'];
      Api.defaultHeader.putIfAbsent("token", () => token);
      print("登陆成功");
    } else {
      return Future.error("账号密码错误");
    }
    save();
    return Future.value(false);
  }

  Logout() {
    IsLogin = false;
    save();
  }

  // 反持久化
  fromJson(Map<String, dynamic> json) {
    IsLogin = json['IsLogin'];
    token = json['token'];
  }

  // 持久化
  Map<String, dynamic> toJson() {
    return {
      'IsLogin': IsLogin,
      'token': token,
    };
  }
}

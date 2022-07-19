import 'dart:convert';

import 'package:dino/page/auth/loginForm.dart';
import 'package:dino/page/auth/resetpassword.dart';
import 'package:dino/page/auth/signupForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';

class AppState {
  bool IsLogin = false;
  String token = "";
  String version = "v0.0.1";

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
    var res = await Api.post("/api/v1/auth/login", body: payload);
    if (res["code"] == 0) {
      IsLogin = true;
      token = res['data'];
      Api.defaultHeader.putIfAbsent("token", () => token);
    } else {
      return Future.error(res["message"]);
    }
    save();
    return Future.value(false);
  }

  Future<bool> Signup(Signupform payload) async {
    var res = await Api.post("/api/v1/auth/signup", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["message"]);
    }
  }

  Future<bool> sendCode(ResetPasswordform payload) async {
    var res = await Api.post("/api/v1/auth/sendcode", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["message"]);
    }
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

  resetPassword(ResetPasswordform payload) async {
    var res = await Api.post("/api/v1/auth/resetpassword", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["message"]);
    }
  }
}

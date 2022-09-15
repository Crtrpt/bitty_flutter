import 'dart:convert';

import 'package:bitty/page/auth/loginForm.dart';
import 'package:bitty/page/auth/resetpasswordForm.dart';
import 'package:bitty/page/auth/signupForm.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';

class AppState {
  dynamic userInfo = null;
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

  wakeup() {
    // this.getContactList();
    // this.getGroupList();
  }

  // getContactList() {
  //   print("获取contact列表");
  //   Api.get("contact/list").then((res) => {
  //         if (res['code'] == 0) {this.contactList = res['data']}
  //       });
  // }

  // getGroupList() {
  //   print("获取群组列表");
  //   Api.get("group/list").then((res) => {
  //         if (res['code'] == 0) {this.contactList = res['data']}
  //       });
  // }

  save() {
    var content = jsonEncode(this);
    print(content);
    if (content != null) {
      this.prefs?.setString("store", content);
    }
  }

  logout() {
    this.IsLogin = false;
    print("退出登录");
  }

  Future<bool> Login(Loginform payload) async {
    var res = await Api.post("auth/login", body: payload);
    print("==============================================");
    if (res["code"] == 0) {
      IsLogin = true;
      userInfo = res['data'];
      token = res['data']['token'];
      Api.defaultHeader.putIfAbsent("token", () => token);
      this.wakeup();
    } else {
      return Future.error(res["msg"]);
    }
    save();
    return Future.value(false);
  }

  Future<bool> Signup(Signupform payload) async {
    var res = await Api.post("auth/signup", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["msg"]);
    }
  }

  Future<bool> sendCode(ResetPasswordForm payload) async {
    var res = await Api.post("auth/sendcode", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["msg"]);
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

  resetPassword(ResetPasswordForm payload) async {
    var res = await Api.post("auth/resetpassword", body: payload);
    if (res["code"] == 0) {
      return Future.value(true);
    } else {
      return Future.error(res["msg"]);
    }
  }
}

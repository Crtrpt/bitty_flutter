import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState {
  bool IsLogin = false;

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

  setLogin(dynamic payload) {
    print("登陆======");
    IsLogin = true;
    save();
  }

  Logout() {
    IsLogin = false;
    save();
  }

  fromJson(Map<String, dynamic> json) {
    IsLogin = json['IsLogin'];
  }

  // method
  Map<String, dynamic> toJson() {
    return {
      'IsLogin': IsLogin,
    };
  }
}

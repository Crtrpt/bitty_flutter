import 'package:dino/page/home.dart';
import 'package:dino/page/system/setting.dart';
import 'package:dino/page/user/endpoint.dart';
import 'package:dino/page/user/profile.dart';
import 'package:dino/page/user/scenes/chart.dart';
import 'package:flutter/material.dart';

import './page/auth/findpassword.dart';
import './page/auth/login.dart';
import './page/auth/reset.dart';
import './page/auth/signup.dart';

Map<String, Widget Function(BuildContext)> route = {
  '/home': (context) => MyHomePage(),
  //登录
  '/auth/login': (context) => Login(),
  //注册
  '/auth/signup': (context) => Signup(),
  //重置
  '/auth/reset': (context) => Reset(),
  //找回密码
  '/auth/findpassword': (context) => FindPassword(),
  //系统设置
  '/system/setting': (context) => Setting(),
  //系统通知列表
  '/system/alertList': (context) => Setting(),
  //系统通知详情
  '/system/alert': (context) => Setting(),
  //用户列表
  '/user/endpoint': (context) => Endpoint(),
  //搜索
  '/user/search': (context) => Endpoint(),
  //chart列表
  '/user/chart': (context) => Chart(),
  //用户信息
  '/user/profile': (context) => Profile(),
  // "/tool/qrscan": (context) => QRViewExample()
};

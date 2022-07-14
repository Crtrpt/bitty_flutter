import 'package:dino/page/home.dart';
import 'package:dino/page/user/chart.dart';
import 'package:dino/page/user/profile.dart';
import 'package:dino/page/user/search.dart';
import 'package:dino/page/user/session.dart';
import 'package:dino/page/user/sessionSetting.dart';
import 'package:dino/page/user/systemMessage.dart';
import 'package:dino/page/user/userCard.dart';
import 'package:dino/page/user/userSetting.dart';
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
  '/system/setting': (context) => UserSetting(),
  //用户列表
  '/user/session': (context) => Session(),
  //聊天设置
  '/user/sessionSetting': (context) => SessionSetting(),
  //用户名片
  '/user/card': (context) => UserCard(),
  //搜索
  '/user/search': (context) => Session(),
  //chart列表
  '/user/chart': (context) => Chart(),
  //用户信息
  '/user/profile': (context) => Profile(),
  //搜索用户
  '/user/search': (context) => Search(),
  //系统消息
  '/system/message': (context) => SystemMessage(),
  // "/tool/qrscan": (context) => QRViewExample()
};

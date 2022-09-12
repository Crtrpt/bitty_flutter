import 'package:dino/page/account/group.dart';
import 'package:dino/page/account/profile.dart';
import 'package:dino/page/account/setting.dart';
import 'package:dino/page/contact/contact.dart';
import 'package:dino/page/contact/profile.dart';
import 'package:dino/page/contact/search.dart';
import 'package:dino/page/group/create.dart';
import 'package:dino/page/home.dart';
import 'package:dino/page/session/session.dart';
import 'package:dino/page/user/userSetting.dart';
import 'package:flutter/material.dart';
import './page/auth/findpassword.dart';
import './page/auth/login.dart';
import './page/auth/reset.dart';
import './page/auth/signup.dart';
import 'page/account/contact.dart';
import 'page/auth/license.dart';
import 'page/chat/chart.dart';
import 'page/group/group.dart';
import 'page/group/profile.dart';
import 'page/group/search.dart';
import 'page/message/detail.dart';
import 'page/message/message.dart';
import 'page/session/profile.dart';

Map<String, Widget Function(BuildContext)> route = {
  '/home': (context) => MyHomePage(),
  //登录
  '/auth/login': (context) => Login(),
  //注册
  '/auth/signup': (context) => Signup(),
  //授权许可
  '/license': (context) => License(),
  //重置
  '/auth/reset': (context) => Reset(),
  //找回密码
  '/auth/findpassword': (context) => FindPassword(),
  //用户列表
  '/account/setting': (context) => AccountSetting(),
  //群组设置
  '/account/group': (context) => AccountGroup(),
  //联系人设置
  '/account/contact': (context) => AccountContact(),

  '/message': (context) => Message(),
  '/message/detail': (context) => MessageDetail(),

  '/session': (context) => Session(),
  '/session/chat': (context) => Chat(),
  '/session/profile': (context) => SessionProfile(),

  '/contact': (context) => Contact(),
  '/contact/profile': (context) => ContactProfile(),
  '/contact/search': (context) => ContactSearch(),

  '/group': (context) => Group(),
  '/group/create': (context) => GroupCreate(),
  '/group/profile': (context) => GroupProfile(),
  '/group/search': (context) => GroupSearch(),
};

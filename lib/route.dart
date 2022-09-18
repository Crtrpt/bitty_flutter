import 'package:bitty/page/account/group.dart';
import 'package:bitty/page/account/profile.dart';
import 'package:bitty/page/account/setting.dart';
import 'package:bitty/page/auth/privacypolicy.dart';
import 'package:bitty/page/auth/resetpassword.dart';
import 'package:bitty/page/contact/contact.dart';
import 'package:bitty/page/contact/profile.dart';
import 'package:bitty/page/contact/search.dart';
import 'package:bitty/page/group/create.dart';
import 'package:bitty/page/group/group_member.dart';
import 'package:bitty/page/group/group_member_detail.dart';
import 'package:bitty/page/home.dart';
import 'package:bitty/page/session/session.dart';
import 'package:flutter/material.dart';
import './page/auth/login.dart';
import './page/auth/signup.dart';
import 'page/account/contact.dart';
import 'page/account/virtual_account.dart';
import 'page/auth/license.dart';
import 'page/chat/chat.dart';
import 'page/group/group.dart';
import 'page/group/profile.dart';
import 'page/group/search.dart';
import 'page/message/detail.dart';
import 'page/message/message.dart';
import 'page/session/profile.dart';

Map<String, Widget Function(BuildContext)> route = {
  //首页
  '/home': (context) => MainPage(),
  //登录
  '/auth/login': (context) => Login(),
  //注册
  '/auth/signup': (context) => Signup(),
  //授权许可
  '/license': (context) => License(),
  //隐私条款
  '/privacy_policy': (context) => PrivacyPolicy(),
  //找回密码
  '/auth/findpassword': (context) => ResetPassword(),
  //用户列表
  '/account/profile': (context) => AccountProfile(),
  //用户列表
  '/account/setting': (context) => AccountSetting(),
  //群组设置
  '/account/group': (context) => AccountGroup(),
  //联系人设置
  '/account/contact': (context) => AccountContact(),
  //虚拟账户
  "/account/virtual_account": (context) => VirtualAccount(),
  //我的消息列表
  '/message': (context) => Message(),
  //消息详情
  '/message/detail': (context) => MessageDetail(),
  //session列表
  '/session': (context) => Session(),
  //session信息
  '/session/profile': (context) => SessionProfile(),
  //chat界面
  '/session/chat': (context) => Chat(),
  //联系人列表
  '/contact': (context) => Contact(),
  //联系人信息
  '/contact/profile': (context) => ContactProfile(),
  //联系人搜索
  '/contact/search': (context) => ContactSearch(),
  //群组列表
  '/group': (context) => Group(),
  //群成员列表
  '/group/member': (context) => GroupMemberView(),
  //群成员列表
  '/group/member/detail': (context) => GroupMemberDetail(),
  //创建群组
  '/group/create': (context) => GroupCreate(),
  //群组详情
  '/group/profile': (context) => GroupProfile(),
  //群组搜索
  '/group/search': (context) => GroupSearch(),
};

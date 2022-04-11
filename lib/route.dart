import 'package:bitty_v1/page/home.dart';
import 'package:bitty_v1/page/system/setting.dart';
import 'package:flutter/material.dart';

import './page/auth/findpassword.dart';
import './page/auth/login.dart';
import './page/auth/reset.dart';
import './page/auth/signup.dart';

Map<String, Widget Function(BuildContext)> route = {
  '/': (context) => MyHomePage(),
  '/auth/login': (context) => Login(),
  '/auth/signup': (context) => signup(),
  '/auth/reset': (context) => reset(),
  '/auth/findpassword': (context) => findpassword(),
  '/system/setting': (context) => setting()
};

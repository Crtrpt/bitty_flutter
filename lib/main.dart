import 'package:dino/page/auth/login.dart';
import 'package:dino/page/home.dart';
import 'package:dino/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'state/appState.dart';

late AppState state;
Future<void> main() async {
  //初始化状态
  state = new AppState();
  state.Init();
  runApp(Bitty());
}

class Bitty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isLogin = state.IsLogin;
    print("用户登陆状态" + isLogin.toString());
    return MaterialApp(
        key: Key("home"),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh', "CN"),
          const Locale('en', "US"),
        ],
        title: 'Dino',
        routes: route,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLogin ? MyHomePage() : Login());
  }
}

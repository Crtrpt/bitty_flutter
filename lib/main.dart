import 'package:dino/route.dart';
import 'package:flutter/material.dart';

import 'state/appState.dart';

Future<void> main() async {
  //初始化状态
  new AppState();
  runApp(Bitty());
}

class Bitty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dino',
      initialRoute: '/user/chart',
      routes: route,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

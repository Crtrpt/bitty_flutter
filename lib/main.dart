import 'package:bitty_v1/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Bitty());
}

class Bitty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: route,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

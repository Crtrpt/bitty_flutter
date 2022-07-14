import 'package:flutter/material.dart';

class SystemMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统消息"),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("系统消息")],
        ),
      ),
    );
  }
}

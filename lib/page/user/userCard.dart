import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户名片"),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("用户名片")],
        ),
      ),
    );
  }
}

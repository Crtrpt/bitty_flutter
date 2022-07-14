import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("搜索用户"),
        actions: [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Text("搜索用户")],
        ),
      ),
    );
  }
}

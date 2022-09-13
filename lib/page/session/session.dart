import 'dart:collection';

import 'package:dino/data/sessionList.dart';
import 'package:dino/main.dart';
import 'package:flutter/material.dart';

class Session extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sessionState();
}

class _sessionState extends State<Session> {
  List<dynamic> sessionList = [];

  @override
  void initState() {
    super.initState();
    state.getSessionList();
    print("======================\n");
    (state.sessionList as Map).forEach((v, k) {
      print(v);
      this.sessionList.add(HashMap.from(k));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "会话",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        actions: [
          //搜索
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/group/search");
              }),
          IconButton(
              icon: Icon(Icons.add),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/group/create");
              }),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: sessionList.length,
          itemBuilder: (context, idx) {
            return Text(sessionList[0].session.name);
          },
        ),
      ),
    );
  }
}

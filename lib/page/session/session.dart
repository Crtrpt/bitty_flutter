import 'package:dino/data/sessionList.dart';
import 'package:flutter/material.dart';

import '../user/_avatar.dart';
import '_sessionCard.dart';

class Session extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sessionState();
}

class _sessionState extends State<Session> {
  var sessionList = [];

  @override
  void initState() {
    super.initState();
    this.sessionList = getSessionList();
  }

  @override
  Widget build(BuildContext context) {
    var list = sessionList.map((e) {
      return SessionCard(e);
    }).toList();
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
      body: Text("会话"),
    );
  }
}

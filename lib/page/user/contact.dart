import 'package:dino/data/sessionList.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_sessionCard.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sessionState();
}

class _sessionState extends State<Contact> {
  var sessionList = [];

  @override
  void initState() {
    super.initState();
    this.sessionList = getSessionList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        AppBar(
          leading: null,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            "联系人",
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
                  Navigator.pushNamed(context, "/user/search");
                }),
          ],
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ListBehavior(),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              itemBuilder: (context, idx) {
                return SessionCard(this.sessionList[idx]);
              },
              itemCount: sessionList.length,
            ),
          ),
        )
      ],
    ));
  }
}

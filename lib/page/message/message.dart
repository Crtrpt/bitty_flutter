import 'package:dino/data/sessionList.dart';
import 'package:dino/page/contact/item.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _messageState();
}

class _messageState extends State<Message> {
  var sessionList = [];

  @override
  void initState() {
    super.initState();
    this.sessionList = getSessionList();
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
          "未读消息",
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
        ],
      ),
      body: Text("未读消息列表"),
    );
  }
}

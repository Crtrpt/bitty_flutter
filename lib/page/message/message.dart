import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageState();
}

class MessageState extends State<Message> {
  var sessionList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.grey,
              onPressed: () {
                Navigator.pop(context);
              }),
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
          )),
      body: Text("未读消息列表"),
    );
  }
}

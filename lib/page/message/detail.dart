import 'package:flutter/material.dart';

class MessageDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _message_detail_state();
}

class _message_detail_state extends State<MessageDetail> {
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
          "信息",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Text("群组"),
    );
  }
}

import 'package:flutter/material.dart';

import 'msg.dart';
import 'publishbox.dart';

// ignore: top_level_function_literal_block

class Chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

class _endpointState extends State<Chart> {
  var msgList = [];

  var getMsgList = () {
    List<Map<String, dynamic>> list = [];
    for (var i = 0; i < 15; i++) {
      var is_me = (i % 3 == 0);
      list.add({
        "id": i,
        "name": "xx" + i.toString(),
        "msg": "这是说的什么什么什么什么是什么？这是说的什么什么什么什么是什么这是说的什么什么什么什么是"
            "什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的"
            "这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么这是说的什么什么什么什么是什么",
        "last_time": "20:20",
        "is_me": is_me
      });
    }
    return list;
  };
  @override
  void initState() {
    super.initState();
    this.msgList = this.getMsgList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("聊天(" + msgList.length.toString() + ")"),
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert_sharp),
              onPressed: () {
                Navigator.pushNamed(context, "/tool/qrscan");
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, idx) {
                return msg(msgList[idx]);
              },
              itemCount: msgList.length,
            )),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: PublishBox(),
            ),
          ],
        ),
      ),
    );
  }
}

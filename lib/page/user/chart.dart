import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_msg.dart';
import '_publishbox.dart';

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
        "f_id": i,
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
        // leading: IconButton(
        //   icon: Image.network("https://api.multiavatar.com/11.png"),
        //   onPressed: () => {},
        // ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "飞翔的白龙马",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
              color: Colors.grey,
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
              child: ScrollConfiguration(
                  behavior: ListBehavior(),
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return msg(msgList[idx]);
                    },
                    itemCount: msgList.length,
                  )),
            ),
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

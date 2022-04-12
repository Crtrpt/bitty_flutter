import 'package:dino/data/messageList.dart';
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
  var endpoint;
  var msgList = [];

  @override
  void initState() {
    super.initState();
    this.msgList = getMsgList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Image.network("https://api.multiavatar.com/11.png"),
        //   onPressed: () => {},
        // ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          "飞翔的白龙马",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
              color: Colors.grey,
              icon: Icon(Icons.video_call),
              onPressed: () {
                Navigator.pushNamed(context, "/tool/qrscan");
              }),
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
            PublishBox(),
          ],
        ),
      ),
    );
  }
}

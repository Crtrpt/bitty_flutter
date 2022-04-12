import 'package:dino/data/messageList.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../_msg.dart';
import '../_publishbox.dart';

class Chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  var endpoint;
  var msgList = [];

  @override
  void initState() {
    super.initState();
    msgList = getMsgList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: Text(
          faker.person.name(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Draggable(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.keyboard_voice),
        ),
        feedback: FloatingActionButton(
          elevation: 0.2,
          onPressed: () {},
          child: Icon(Icons.keyboard_voice),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                  behavior: ListBehavior(),
                  child: ListView.builder(
                    itemBuilder: (context, idx) {
                      return Msg(msgList[idx]);
                    },
                    itemCount: msgList.length,
                  )),
            ),
            Draggable(axis: Axis.vertical, child: PublishBox(), feedback: PublishBox())
          ],
        ),
      ),
    );
  }
}

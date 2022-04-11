import 'package:dino/data/messageList.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../_msg.dart';
import '../_publishbox.dart';

class Map extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapState();
}

class MapState extends State<Map> {
  var endpoint;

  var msgList = [];

  var expand = false;

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
        childWhenDragging: Container(),
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
            GestureDetector(
              onPanUpdate: (details) {
                // Swiping in right direction.
                if (details.delta.dy > 8) {
                  print("右");
                }

                // Swiping in left direction.
                if (details.delta.dy < -8) {
                  print("上");
                  this.setState(() {
                    expand = true;
                  });
                }
              },
              child: PublishBox(expand: this.expand),
            )
          ],
        ),
      ),
    );
  }
}

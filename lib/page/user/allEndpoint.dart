import 'package:dino/data/endpointList.dart';
import 'package:dino/i18n/default.i18n.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_avatar.dart';
import '_endpointCard.dart';

class AllEndpoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

class _endpointState extends State<AllEndpoint> {
  var endpointList = [];

  @override
  void initState() {
    super.initState();
    this.endpointList = getEndpointList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        AppBar(
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Avatar(10, size: 50),
          ),
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            "connector".i18n + "(" + endpointList.length.toString() + ")",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          actions: [
            //视频通讯录
            IconButton(
                icon: Icon(Icons.search),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, "/system/search");
                }),
            //系统消息
            IconButton(
                icon: Icon(Icons.add_alert),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, "/tool/alertList");
                }),
            //增加
            IconButton(
                icon: Icon(Icons.add),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, "/system/add");
                })
          ],
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ListBehavior(),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              itemBuilder: (context, idx) {
                return EndpointCard(this.endpointList[idx]);
              },
              itemCount: endpointList.length,
            ),
          ),
        )
      ],
    ));
  }
}

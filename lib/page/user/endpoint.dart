import 'dart:math';

import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_endpointCard.dart';

// ignore: top_level_function_literal_block

class Endpoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

var renderName = ["郭进", "黄蓉", "黄老邪", "梅超风"];
var lastMsg = ["看下这个是哪里出了问题"];
var seed = Random(1000);

class _endpointState extends State<Endpoint> {
  var endpointList = [];

  var getEndpointList = () {
    List<Map<String, dynamic>> list = [];
    for (var i = 0; i < 20; i++) {
      var name = renderName[seed.nextInt(renderName.length)];
      list.add({"id": i, "name": name, "last_msg": "打开电脑修改下bug", "last_time": "20:20"});
    }
    return list;
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.endpointList = this.getEndpointList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "列表(" + endpointList.length.toString() + ")",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/tool/qrscan");
              }),
          IconButton(
              icon: Icon(Icons.add),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/tool/qrscan");
              })
        ],
      ),
      body: Center(
        child: ScrollConfiguration(
          behavior: ListBehavior(),
          child: ListView.builder(
            itemBuilder: (context, idx) {
              return EndpointCard(this.endpointList[idx]);
            },
            itemCount: endpointList.length,
          ),
        ),
      ),
    );
  }
}

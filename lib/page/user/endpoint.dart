import 'package:dino/data/endpointList.dart';
import 'package:dino/page/user/_avatar.dart';
import 'package:dino/page/user/userDrawer.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_endpointCard.dart';

// ignore: top_level_function_literal_block

class Endpoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

class _endpointState extends State<Endpoint> {
  var endpointList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.endpointList = getEndpointList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: UserDrawer(),
      ),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10),
          child: Avatar(10, size: 50),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "列表(" + endpointList.length.toString() + ")",
          style: TextStyle(
            fontSize: 18,
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

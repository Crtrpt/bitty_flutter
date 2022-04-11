import 'package:dino/data/endpointList.dart';
import 'package:dino/i18n/default.i18n.dart';
import 'package:dino/utils/listBehavior.dart';
import 'package:flutter/material.dart';

import '_avatar.dart';
import '_endpointCard.dart';

// import 'package:i18n_extension/i18n_extension.dart';
class Endpoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _endpointState();
}

class _endpointState extends State<Endpoint> {
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
            "recent".i18n + "(" + endpointList.length.toString() + ")",
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

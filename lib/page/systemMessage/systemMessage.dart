import 'package:dino/data/systemMessageList.dart';
import 'package:flutter/material.dart';

class SystemMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _systemMessageState();
}

class _systemMessageState extends State<SystemMessage> {
  var systemMessageList = [];

  @override
  void initState() {
    super.initState();
    this.systemMessageList = getSystemMessageList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("系统消息"),
        actions: [],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemBuilder: (context, idx) {
          return TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/system/messageDetail", arguments: systemMessageList[idx]);
              },
              child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          systemMessageList[idx]['title'].toString(),
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                        Text(
                          systemMessageList[idx]['time'].toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 10, height: 1.5),
                        )
                      ],
                    ),
                  )));
        },
        itemCount: systemMessageList.length,
      ),
    );
  }
}

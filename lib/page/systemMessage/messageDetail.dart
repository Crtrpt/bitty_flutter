import 'package:dino/page/systemMessage/msg/accept.dart';
import 'package:dino/page/systemMessage/msg/refuse.dart';
import 'package:flutter/material.dart';

import 'msg/invite.dart';

class MessageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map arg = ModalRoute.of(context)!.settings.arguments as Map;
    print(arg);
    var render = null;
    switch (arg['type']) {
      case 0:
        render = Invite(arg);
        break;
      case 1:
        render = Accept(arg);
        break;
      case 2:
        render = Refuse(arg);
        break;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("消息详情"),
          actions: [],
        ),
        body: render);
  }
}

import 'package:bitty/page/render/_msg_text.dart';
import 'package:flutter/material.dart';

import './_msg_image.dart';

class MsgRender extends StatefulWidget {
  final msgList;
  MsgRender(Map<dynamic, dynamic> this.msgList);

  @override
  State<StatefulWidget> createState() => _MsgRender(msgList);
}

class _MsgRender extends State<MsgRender> {
  var msg;
  _MsgRender(this.msg);

  @override
  Widget build(BuildContext context) {
    switch (msg['type']) {
      case 0:
        //文本消息
        return MsgText(msg['msg']);
      case 1:
        //图片消息
        return MsgImage(msg['msg']);
      default:
        //默认消息
        return MsgText(msg['msg']);
    }
  }
}

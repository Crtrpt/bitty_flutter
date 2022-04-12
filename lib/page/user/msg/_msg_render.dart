import 'package:dino/page/user/msg/_msg_image.dart';
import 'package:dino/page/user/msg/_msg_text.dart';
import 'package:flutter/material.dart';

class MsgRender extends StatelessWidget {
  var msg;
  MsgRender(this.msg);

  @override
  Widget build(BuildContext context) {
    switch (msg['type']) {
      case 0:
        return MsgText(msg['msg'] + msg['type'].toString());
      case 1:
        return MsgImage(msg['msg'] + msg['type'].toString());
      default:
        return MsgText(msg['msg']);
    }
  }
}

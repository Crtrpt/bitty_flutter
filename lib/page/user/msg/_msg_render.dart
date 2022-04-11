import 'package:dino/page/user/msg/_msg_text.dart';
import 'package:flutter/material.dart';

import '_msg_audio.dart';
import '_msg_file.dart';
import '_msg_image.dart';
import '_msg_map.dart';
import '_msg_video.dart';

class MsgRender extends StatefulWidget {
  var msgList;
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
      case 2:
        //文件消息
        return MsgFile(msg['msg']);
      case 3:
        //视频消息
        return MsgVideo(msg['msg']);
      case 4:
        //音频消息
        return MsgAudio(msg['msg']);
      case 4:
        //地图消息
        return MsgMap(msg['msg']);
      default:
        //默认消息
        return MsgText(msg['msg']);
    }
  }
}

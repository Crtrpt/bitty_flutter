import 'package:dino/page/user/_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'msg/_msg_render.dart';

class Msg extends StatefulWidget {
  Map msgList = {};
  Msg(this.msgList);

  @override
  State<StatefulWidget> createState() => _msgState(msgList);
}

class _msgState extends State<Msg> {
  Map msgList = {};

  _msgState(this.msgList);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Flex(
        direction: Axis.horizontal,
        textDirection: msgList["is_me"] ? TextDirection.rtl : TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(msgList['f_id']),
          //消息体
          Expanded(
              child: Column(
            textDirection: msgList["is_me"] ? TextDirection.rtl : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //发送用户
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  msgList["name"],
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ),
              //发送时间

              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x10000000),
                      blurRadius: .1,
                      spreadRadius: 0.5,
                    ), //BoxShadow
                  ],
                  color: msgList["is_me"] ? Colors.lightGreenAccent : Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(4)),
                ),
                child: MsgRender(msgList),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  msgList["last_time"],
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ],
          )),
          //留白
          SizedBox(
            width: 50,
            height: 40,
          ),
        ],
      ),
    );
  }
}

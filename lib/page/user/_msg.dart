import 'package:dino/page/user/_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class msg extends StatelessWidget {
  Map msgList = {};
  msg(this.msgList);

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
                child: Text(msgList["msg"], style: TextStyle(color: Colors.black87)),
              )
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

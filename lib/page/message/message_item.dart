import 'package:bitty/const.dart';
import 'package:flutter/material.dart';

import '../../model/msg.dart';

class MessageItem extends StatelessWidget {
  MessageItem(this.msg);
  final Msg msg;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: 1, style: BorderStyle.solid, color: Colors.grey.shade200),
        )),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg.content!,
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                          child: Text(
                        constMsgType[msg.type!],
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade700),
                      )),
                    ),
                    Text(
                      msg.created_at!,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                  ],
                )
              ],
            )));
  }
}

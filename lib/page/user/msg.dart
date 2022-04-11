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
          Container(
            padding: EdgeInsets.all(5),
            child: Image.network(
              "https://api.multiavatar.com/" + msgList['name'] + ".png",
              width: 40,
              height: 40,
            ),
          ),
          //消息体
          Expanded(
              child: Column(
            textDirection: msgList["is_me"] ? TextDirection.rtl : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: msgList["is_me"] ? Colors.lightGreenAccent : Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10)),
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

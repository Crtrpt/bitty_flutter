import 'package:bitty/api/api.dart';
import 'package:bitty/const.dart';
import 'package:bitty/model/msg.dart';
import 'package:flutter/material.dart';

class MessageDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageDetailState();
}

class MessageDetailState extends State<MessageDetail> {
  action(Msg msg, int ops) {
    Api.post("msg/action", body: {
      "message_id": msg.message_id,
      "type": msg.type,
      "action": ops
    }).then((res) {
      if (res['code'] == 0) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('操作成功'),
        ));
        setState(() {
          msg = Msg.fromJson(res['data']);
        });
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('操作失败'),
        ));
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var msg = (ModalRoute.of(context)!.settings.arguments as Msg);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            }),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "消息详情",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        msg.content!,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      "消息类型:" + constMsgType[msg.type!],
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                    Text(
                      "创建时间:" + msg.created_at!,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: msg.status == 0
                      ? [
                          ElevatedButton(
                              onPressed: () => action(msg, 0),
                              child: Text("同意")),
                          OutlinedButton(
                              onPressed: () => action(msg, 1),
                              child: Text("拒绝")),
                          OutlinedButton(
                              onPressed: () => action(msg, -1),
                              child: Text("撤回")),
                          OutlinedButton(
                              onPressed: () => action(msg, 3),
                              child: Text(
                                "删除",
                                style: TextStyle(color: Colors.red.shade500),
                              ))
                        ]
                      : [
                          Text(
                            "已处理",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                          ),
                          Text(
                            msg.result_payload!,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                          )
                        ],
                )),
              )
            ],
          )),
    );
  }
}

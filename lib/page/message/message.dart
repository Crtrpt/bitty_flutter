import 'package:bitty/api/api.dart';
import 'package:bitty/page/message/message_item.dart';
import 'package:flutter/material.dart';

import '../../model/msg.dart';

class Message extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MessageState();
}

class MessageState extends State<Message> {
  List<Msg> list = [];
  int count = 0;
  bool isread = true;
  Key? buildKey = ValueKey(DateTime.now().millisecondsSinceEpoch);
  @override
  void initState() {
    super.initState();
  }

  Future<List<Msg>> fetchList() async {
    var res =
        await Api.get(this.isread ? "msg/unreadMessage" : "msg/allMessage");
    if (res['code'] == 0) {
      list.clear();
      (res['data'] as List).forEach((item) {
        print(item);
        list.add(Msg.fromJson(item));
      });
      return Future.value(list);
    }
    return Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.grey,
              onPressed: () {
                setState(() {
                  buildKey = ValueKey(20);
                });
              }),
          IconButton(
              icon: Icon(Icons.list),
              color: Colors.grey,
              onPressed: () {
                setState(() {
                  this.isread = !this.isread;
                });
              }),
        ],
        title: Text(
          this.isread ? "未读消息" : "全部消息",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: FutureBuilder(
          key: buildKey,
          future: fetchList(),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot res) {
            if (res.hasError) {
              return Text(res.error.toString());
            }
            return res.connectionState == ConnectionState.done
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    itemCount: res.data.length,
                    itemBuilder: (context, idx) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, "/message/detail",
                              arguments: res.data[idx])
                        },
                        child: MessageItem(res.data[idx]),
                      );
                    })
                : Center(
                    child: Text("加载中..."),
                  );
          }),
    );
  }
}

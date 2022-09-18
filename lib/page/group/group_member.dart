import 'package:bitty/api/api.dart';
import 'package:bitty/model/group.dart';
import 'package:flutter/material.dart';

import 'group_member_item.dart';

class GroupMemberView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupMemberState();
}

class GroupMemberState extends State<GroupMemberView> {
  List<GroupMember> list = [];
  int count = 0;
  Key? buildKey = ValueKey(DateTime.now().millisecondsSinceEpoch);
  @override
  void initState() {
    super.initState();
  }

  Future<List<GroupMember>> fetchList(String groupId) async {
    print("拉取群成员" + groupId);
    var res = await Api.get("group/users?group_id=" + groupId);
    if (res['code'] == 0) {
      list.clear();
      (res['data'] as List).forEach((item) {
        list.add(GroupMember.fromJson(item));
      });
      return Future.value(list);
    }
    return Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    var group_id = (ModalRoute.of(context)!.settings.arguments as String);
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
              icon: Icon(Icons.add), color: Colors.grey, onPressed: () {})
        ],
        title: Text(
          "群成员",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: FutureBuilder(
          key: buildKey,
          future: fetchList(group_id!),
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
                          Navigator.pushNamed(context, "/group/member/detail",
                              arguments: {
                                'group_id': group_id,
                                'user_id':
                                    (res.data[idx] as GroupMember).user_id,
                              })
                        },
                        child: GroupMemberItem(res.data[idx]),
                      );
                    })
                : Center(
                    child: Text("加载中..."),
                  );
          }),
    );
  }
}

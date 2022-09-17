import 'package:bitty/api/api.dart';
import 'package:bitty/page/group/avatar.dart';
import 'package:bitty/model/group.dart';
import 'package:flutter/material.dart';

class GroupSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupSearchState();
}

class _GroupSearchState extends State<GroupSearch> {
  late TextEditingController searchController;

  late TextEditingController anwserController;

  void initState() {
    super.initState();
    searchController = new TextEditingController();
    anwserController = new TextEditingController();
  }

  List<Group> groups = [];
  Group? cur;
  dynamic strategy;
  showQuestion() {
    showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
              title: Text('回答验证问题'),
              content: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.strategy['add_group_question']),
                    TextFormField(
                      controller: anwserController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(2),
                          border: OutlineInputBorder(),
                          hintText: "输入你的验证答案"),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => {
                    this.step2(),
                    Navigator.pop(context),
                  },
                  child: Text("确定"),
                ),
                OutlinedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: Text("取消"),
                ),
              ],
            ));
  }

  step2() {
    Api.post("group/join", body: {
      "type": 1,
      "target_id": cur?.group_id,
      "payload": {
        "answer": anwserController.value.text.toString(),
        "group_id": cur?.group_id,
      }
    }).then((res) => {
          if (res['code'] == 0)
            {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text("好友申请已发送"),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("确定"))
                  ],
                ),
              )
            }
          else
            {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: Text(res['msg']),
                        actions: [
                          ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("确定"))
                        ],
                      ))
            }
        });
  }

  step1(Group u) {
    Api.post("group/get_user_group_strategy", body: {'group_id': u.group_id})
        .then((res) {
      if (res['code'] == 0) {
        this.strategy = res['data'];
        this.cur = u;
        switch (res['data']['add_group_type'] as int) {
          case 0:
            break;
          case 1:
            this.step2();
            break;
          case 2:
            this.step2();
            break;
          case 3:
            this.showQuestion();
            break;
          case 4:
            this.showQuestion();
            break;
        }
      }
    });
  }

  search() {
    Api.get("group/search?keywords=" + searchController.text).then((res) => {
          groups.clear(),
          (res['data'] as List<dynamic>).forEach((element) {
            var group = Group.fromJson(element);
            groups.add(group);
          }),
          setState(() {
            groups = this.groups;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        leadingWidth: 0,
        backgroundColor: Colors.grey.shade200,
        title: TextFormField(
          controller: searchController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.arrow_back),
              suffixIcon: IconButton(
                onPressed: () => {search()},
                icon: Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.all(2),
              border: OutlineInputBorder(),
              hintText: "搜索"),
        ),
        elevation: 0.5,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
            children: groups
                .map((e) => Row(
                      children: [
                        GroupAvatar(e),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: Colors.grey.shade200),
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.name ?? "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700),
                                  ),
                                  Text(
                                    e.description ?? "",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () => {step1(e)}, child: Text("申请加入"))
                      ],
                    ))
                .toList()),
      ),
    );
  }
}

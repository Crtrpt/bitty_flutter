import 'package:bitty/api/api.dart';
import 'package:bitty/model/group.dart';
import 'package:flutter/material.dart';

import '../../component/PickFile.dart';

class GroupCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupCreateState();
}

class GroupCreateState extends State<GroupCreate> {
  Group group = Group();

  late TextEditingController name;
  late TextEditingController description;

  late TextEditingController qusition;
  late TextEditingController answer;

  @override
  void initState() {
    super.initState();

    name = new TextEditingController();
    description = new TextEditingController();
    qusition = new TextEditingController();
    answer = new TextEditingController();
    name.addListener(() {
      group.name = name.value.text.toString();
    });
    description.addListener(() {
      group.description = description.value.text.toString();
    });
    qusition.addListener(() {
      group.add_group_question = qusition.value.text.toString();
    });
    answer.addListener(() {
      group.add_group_answer = answer.value.text.toString();
    });

    group.add_group_type = 0;
  }

  create() {
    Api.post("group/create", body: group).then((res) => {
          if (res['code'] == 0) {print("创建成功")}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.grey,
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "创建群组",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
              child: Form(
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 100,
                  child: Center(
                    child: PickFile(
                        onSelectLocalFile: (file) {},
                        onUploadSuccess: (res) {
                          group.avatar = res['data'];
                        }),
                  )),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    hintText: "群昵称"),
              ),
              TextFormField(
                controller: description,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    hintText: "群描述"),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: DropdownButton<int>(
                    value: 0,
                    items: [
                      DropdownMenuItem(
                        child: Text("不允许任何人加入群组"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("允许任何人加入群组"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("经过管理员同意即可加入"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("答对问题即可加入群组"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("答对问题并且经过管理员同意"),
                        value: 4,
                      ),
                    ],
                    onChanged: (e) => {
                          setState(() {
                            group.add_group_type = e;
                          })
                        }),
              ),
              (group.add_group_type! + 0) > 2
                  ? TextFormField(
                      controller: qusition,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0)),
                          ),
                          hintText: "问题"),
                    )
                  : Container(),
              (group.add_group_type! + 0) > 2
                  ? TextFormField(
                      controller: answer,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                          hintText: "答案"),
                    )
                  : Container(),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                          width: 10,
                          height: 10,
                          child: Checkbox(
                              value: group.allow_search == 1,
                              onChanged: (v) {
                                setState(() {
                                  group.allow_search = v! ? 1 : 0;
                                });
                              })),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          group.allow_search = group.allow_search == 1 ? 0 : 1;
                        });
                      },
                      child: Text("允许被搜索到"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: SizedBox(
                          width: 10,
                          height: 10,
                          child: Checkbox(
                              value: group.allow_anon_session == 1,
                              onChanged: (v) {
                                setState(() {
                                  group.allow_anon_session = v! ? 1 : 0;
                                });
                              })),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          group.allow_anon_session =
                              group.allow_anon_session == 1 ? 0 : 1;
                        });
                      },
                      child: Text("允许匿名聊天"),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(onPressed: () => create(), child: Text("创建")),
                  OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("取消"))
                ],
              ),
            ],
          )))),
    );
  }
}

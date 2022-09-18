import 'package:bitty/model/group.dart';
import 'package:bitty/page/contact/contect_selector.dart';
import 'package:bitty/page/group/avatar.dart';
import 'package:bitty/state/event.dart';
import 'package:bitty/state/group_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../const.dart';
import '../../state/session_store.dart';

class GroupProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupPofileState();
}

class GroupPofileState extends State<GroupProfile> {
  remove(Group? group) async {
    var res = await showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
              content: Text(
                "确认删除该群组?",
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade500)),
                    onPressed: () => {Navigator.pop(context, 0)},
                    child: Text(
                      "确定",
                    )),
                ElevatedButton(
                    onPressed: () => {Navigator.pop(context, 1)},
                    child: Text("取消"))
              ],
            ));
    if (res != 0) {
      print("用户取消");
      return;
    }
    Api.post("group/remove", body: {
      'group_id': group?.group_id,
    }).then((res) => {
          if (res['code'] == 0)
            {
              showDialog(
                  context: this.context,
                  builder: (context) => AlertDialog(
                        content: Text("删除成功"),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<GroupStore>(context).add(
                                    RemoveGroupEvent(groupId: group?.group_id));
                                BlocProvider.of<SessionStore>(context).add(
                                    RemoveSessionEvent(
                                        sessionId: group?.session_id));
                                int count = 0;
                                Navigator.of(context)
                                    .popUntil((_) => count++ >= 2);
                              },
                              child: Text("确定"))
                        ],
                      ))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupStore, GroupState>(
        builder: (context, state) => Scaffold(
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
                  ((state.cur?.config?.type == 0)
                      ? IconButton(
                          icon: Icon(Icons.settings),
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.pop(context);
                          })
                      : Container()),
                  IconButton(
                      icon: Icon(Icons.person_pin_circle),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
                title: Text(
                  "${state.cur?.group?.name} ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              body: Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                        child: Row(
                          children: [
                            GroupAvatar(
                              state.cur?.group,
                              size: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.cur?.group?.name ?? '',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.cur?.group?.description ?? '',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "创建 : ${state.cur?.group?.created_at}",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                                Text(
                                  "成员数量 : ${state.cur?.group?.member_count}/${state.cur?.group?.max_member_count}",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            )),
                            Container(
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "群内昵称 : ${state.cur?.config?.name}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      "成员类型 : ${constGroupMemberType[state.cur?.config?.type ?? 2]}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      "加入时间 : ${state.cur?.config?.created_at}",
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )),
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text("发起聊天"),
                            ),
                            OutlinedButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, "/group/member",
                                    arguments: state.cur?.group?.group_id)
                              },
                              child: Text(
                                "群成员",
                                style: TextStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => {
                                showModalBottomSheet<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ContactSelector(
                                          selected: (context, userIds) => {
                                                Navigator.pop(context),
                                                print("选择了用户之后")
                                              });
                                    })
                              },
                              child: Text(
                                "邀请好友加入",
                                style: TextStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => {},
                              child: Text(
                                "退出群组",
                                style: TextStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => {remove(state.cur?.group)},
                              child: Text(
                                "删除",
                                style: TextStyle(color: Colors.red.shade500),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

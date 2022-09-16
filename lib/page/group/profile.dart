import 'package:bitty/page/group/avatar.dart';
import 'package:bitty/state/group_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupPofileState();
}

class GroupPofileState extends State<GroupProfile> {
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
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            GroupAvatar(
                              state.cur,
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
                                      "成员类型 : ${state.cur?.config?.type}",
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
                                Navigator.pushNamed(context, "/group/member")
                              },
                              child: Text(
                                "群成员",
                                style: TextStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => {},
                              child: Text(
                                "邀请好友加入",
                                style: TextStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => {},
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

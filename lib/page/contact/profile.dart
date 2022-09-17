import 'package:bitty/api/api.dart';
import 'package:bitty/page/contact/avatar.dart';
import 'package:bitty/model/contact.dart';
import 'package:bitty/model/session.dart';
import 'package:bitty/model/user.dart';
import 'package:bitty/state/event.dart';
import 'package:bitty/state/session_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';

class ContactProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactProfileState();
}

class ContactProfileState extends State<ContactProfile> {
  createSession(User? user) async {
    Api.post("session/create", body: {
      "target_id": user?.user_id,
      "type": 'chat'
    }).then((res) => {
          if (res['code'] == 0)
            {
              BlocProvider.of<SessionStore>(context)
                  .add(AddSessionEvent(SessionList.fronJson(res['data']))),
              BlocProvider.of<SessionStore>(context)
                  .setCurSession(res['data']['session']['session_id']),
              Navigator.pushNamed(context, "/session/chat",
                  arguments: res['data']['session']['session_id'])
            }
        });
  }

  remove(ContactList? contact) async {
    var res = await showDialog(
        context: this.context,
        builder: (context) => AlertDialog(
              content: Text(
                "确认删除?",
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
    Api.post("contact/remove", body: {
      'target_id': contact?.user?.user_id,
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
                                BlocProvider.of<ContactStore>(context).add(
                                    RemoveSessionEvent(
                                        sessionId:
                                            contact?.contact?.session_id));

                                BlocProvider.of<SessionStore>(context).add(
                                    RemoveSessionEvent(
                                        sessionId:
                                            contact?.contact?.session_id));
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
    return BlocBuilder<ContactStore, ContactState>(
        builder: (context, state) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                toolbarHeight: 50,
                backgroundColor: Colors.white,
                elevation: 0.5,
                title: Text(
                  "${state.cur?.contact?.name}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Row(
                          children: [
                            ContactAvatar(
                              state.cur?.user,
                              size: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.cur?.contact?.name ?? '',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.cur?.user?.status ?? '',
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
                        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "创建 : ${state.cur?.contact?.created_at}",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            )),
                            ElevatedButton(
                              onPressed: () => {createSession(state.cur?.user)},
                              child: Text("发起聊天"),
                            ),
                            OutlinedButton(
                              onPressed: () async => {remove(state.cur)},
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

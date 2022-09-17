import 'package:bitty/api/api.dart';
import 'package:bitty/page/contact/avatar.dart';
import 'package:bitty/model/contact.dart';
import 'package:bitty/page/session/avatar.dart';
import 'package:bitty/state/event.dart';
import 'package:bitty/state/session_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';

class SessionProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SessionProfileState();
}

class SessionProfileState extends State<SessionProfile> {
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
    return BlocBuilder<SessionStore, SessionState>(
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
                  "${state.curSession?.session?.name}",
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
                            SessionAvatar(
                              state.curSession?.session,
                              size: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.curSession?.session?.name ?? '',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.curSession?.session?.description ??
                                        '',
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
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "创建于 : ${state.curSession?.session?.created_at}",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            )),
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text("挂起会话"),
                            ),
                            OutlinedButton(
                              onPressed: () => {},
                              child: Text(
                                "删除会话",
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

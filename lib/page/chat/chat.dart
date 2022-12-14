import 'package:bitty/utils/listBehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/session_store.dart';
import '../user/_msg.dart';
import '_publishbox.dart';

class Chat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<Chat> {
  var session;
  var msgList = [];

  var expand = false;
  @override
  void initState() {
    super.initState();
    msgList = [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionStore, SessionState>(
        builder: (context, sessionState) => Scaffold(
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
                centerTitle: true,
                title: Text(
                  sessionState.curSession?.session?.name ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                actions: [
                  IconButton(
                      color: Colors.grey,
                      icon: Icon(Icons.more_vert_sharp),
                      onPressed: () {
                        Navigator.pushNamed(context, "/session/profile");
                      })
                ],
              ),
              body: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ScrollConfiguration(
                          behavior: ListBehavior(),
                          child: ListView.builder(
                            itemBuilder: (context, idx) {
                              return Msg(msgList[idx]);
                            },
                            itemCount:
                                sessionState.curSession?.chatList?.length ?? 0,
                          )),
                    ),
                    GestureDetector(
                      onPanUpdate: (details) {
                        // Swiping in right direction.
                        if (details.delta.dy > 8) {
                          print("???");
                        }

                        // Swiping in left direction.
                        if (details.delta.dy < -8) {
                          print("???");
                          this.setState(() {
                            expand = true;
                          });
                        }
                      },
                      child: PublishBox(expand: this.expand),
                    )
                  ],
                ),
              ),
            ));
  }
}

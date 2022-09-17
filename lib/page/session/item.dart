import 'package:bitty/model/session.dart';
import 'package:bitty/page/session/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/session_store.dart';

class SessionItem extends StatelessWidget {
  SessionItem(this.session);
  final SessionList session;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              BlocProvider.of<SessionStore>(context, listen: false)
                  .setCurSession(session.session!.session_id!),
              Navigator.pushNamed(context, "/session/chat")
            },
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Stack(children: [
                    SessionAvatar(this.session.session),
                    Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: new BoxDecoration(
                            color: Colors.red.shade500,
                            shape: BoxShape.circle,
                          ),
                        )),
                  ]),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(left: 0),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300),
                    )),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    this.session.session?.name ?? "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      this.session.session?.description ?? "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            child: Container(
                              child: Text(
                                "刚刚",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade500),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            )));
  }
}

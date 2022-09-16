import 'package:bitty/page/session/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/session_store.dart';

class Session extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("init =======================");
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.person),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/user/profile");
              }),
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.5,
          title: Text(
            "会话",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade800,
            ),
          ),
          actions: [],
        ),
        body: Container(
          color: Colors.white,
          child: BlocBuilder<SessionStore, SessionState>(
              builder: (context, sessionState) => Column(
                    children: sessionState.sessionList
                        .map((e) => SessionItem(e))
                        .toList(),
                  )),
        ));
  }
}

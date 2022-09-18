import 'package:bitty/page/session/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../state/session_store.dart';

class Session extends StatefulWidget {
  Session({this.opendrawer});
  Function? opendrawer;
  @override
  State<StatefulWidget> createState() =>
      _SessionState(opendrawer: this.opendrawer);
}

class _SessionState extends State<Session> {
  _SessionState({this.opendrawer});
  Function? opendrawer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.notes),
              color: Colors.grey,
              onPressed: () {
                this.opendrawer!();
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
          actions: [
            IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, "/message");
                })
          ],
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

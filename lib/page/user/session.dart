import 'package:dino/data/sessionList.dart';
import 'package:flutter/material.dart';

import '_sessionCard.dart';

class Session extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _sessionState();
}

class _sessionState extends State<Session> {
  var sessionList = [];

  @override
  void initState() {
    super.initState();
    this.sessionList = getSessionList();
  }

  @override
  Widget build(BuildContext context) {
    var list = sessionList.map((e) {
      return SessionCard(e);
    }).toList();
    return CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: <Widget>[
      SliverAppBar(
        stretch: true,
        leading: Padding(
          padding: EdgeInsets.all(10),
          // child: Avatar(10, size: 50),
        ),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "常用",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          //系统消息
          IconButton(
              icon: Icon(Icons.add_alert),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/system/message");
              }),
        ],
        floating: true,
        onStretchTrigger: () {
          // Function callback for stretch
          return Future<void>.value();
        },
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            // StretchMode.fadeTitle,
          ],
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment.center,
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // ),
        ),
      ),
      SliverFillRemaining(child: ListView(padding: EdgeInsets.zero, children: list))
    ]);
  }
}

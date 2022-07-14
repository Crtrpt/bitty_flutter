import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), slivers: <Widget>[
      SliverAppBar(
        stretch: true,
        onStretchTrigger: () {
          // Function callback for stretch
          return Future<void>.value();
        },
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          title: Row(
            children: [
              Column(
                children: [Text(faker.person.name()), Text(faker.person.name())],
              )
            ],
          ),
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
        ),
      ),
      SliverFillRemaining(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ElevatedButton(onPressed: () => {Navigator.pushNamed(context, "/system/setting")}, child: Text("设置")),
          ElevatedButton(
              onPressed: () {
                state.Logout();
                Navigator.pushNamed(context, "/auth/login");
              },
              child: Text("退出登陆")),
        ]),
      )),
    ]));
  }
}

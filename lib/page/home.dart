import 'package:bitty/main.dart';
import 'package:flutter/material.dart';

import '../component/Avatar.dart';
import 'group/group.dart';
import 'contact/contact.dart';
import 'session/session.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var idx = 0;

  late TabController _controller =
      new TabController(initialIndex: 0, length: 3, vsync: this);

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    this._controller.addListener(() {
      setState(() {
        idx = this._controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Avatar(userId: "111", size: 40),
            ),
            ListTile(
              title: Text('设置'),
              onTap: () {
                Navigator.pushNamed(context, "/account/profile");
              },
            ),
            ListTile(
              title: Text('群组设置'),
              onTap: () {
                Navigator.pushNamed(context, "/account/group");
              },
            ),
            ListTile(
              title: Text('联系人设置'),
              onTap: () {
                Navigator.pushNamed(context, "/account/contact");
              },
            ),
            ListTile(
              title: Text("虚拟账户"),
              onTap: () {
                Navigator.pushNamed(context, "/account/virtual_account");
              },
            ),
            ListTile(
              title: const Text("退出"),
              onTap: () {
                Navigator.pushNamed(context, "/auth/login");
                state.logout();
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [Session(), Contact(), Group()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          this._controller.animateTo(i);
        },
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.adjust_sharp), label: "会话"),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "群组"),
        ],
      ),
    );
  }
}

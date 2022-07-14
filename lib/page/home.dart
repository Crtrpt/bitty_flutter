import 'package:dino/page/user/profile.dart';
import 'package:flutter/material.dart';

import 'user/contact.dart';
import 'user/session.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var idx = 0;

  late TabController _controller = new TabController(initialIndex: 0, length: 3, vsync: this);

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
        print("-----------");
        print(idx);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        children: [Session(), Contact(), Profile()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          this._controller.animateTo(i);
        },
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.adjust_sharp), label: "常用"),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
      ),
    );
  }
}

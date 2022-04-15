import 'package:dino/i18n/default.i18n.dart';
import 'package:dino/page/user/profile.dart';
import 'package:flutter/material.dart';

import 'user/allEndpoint.dart';
import 'user/endpoint.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var idx = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // pv.addListener(() {
    //   this.setState(() {
    //     idx = pv.page!.toInt();
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        home: Scaffold(
          body: TabBarView(
            children: [Endpoint(), AllEndpoint(), Profile()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              this.setState(() {
                idx = i;
              });
            },
            currentIndex: idx,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.adjust_sharp), label: "last".i18n),
              BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "connector".i18n),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "me".i18n),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dino/i18n/default.i18n.dart';
import 'package:dino/page/user/allEndpoint.dart';
import 'package:dino/page/user/endpoint.dart';
import 'package:dino/page/user/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pvController;
  var idx = 0;

  @override
  void dispose() {
    pvController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var pv = new PageController();
    pv.addListener(() {
      this.setState(() {
        idx = pv.page!.toInt();
      });
    });
    this.pvController = pv;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pvController,
          children: [Endpoint(), AllEndpoint(), Profile()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (i) {
            this.pvController.jumpToPage(i);
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
        ));
  }
}
import 'package:flutter/material.dart';

import '_avatar.dart';

class SessionSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("聊天设置"),
          actions: [],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 6,
                children: <Widget>[Avatar(1)],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //用户列表
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, contentPadding: EdgeInsets.all(10), hintText: '名称'),
                  ),
                  ElevatedButton(child: Text("删除"), onPressed: () => {})
                ],
              ),
            )
          ],
        ));
  }
}

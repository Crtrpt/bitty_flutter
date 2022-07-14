import 'package:dino/page/user/_avatar.dart';
import 'package:flutter/material.dart';

class UserSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户设置"),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Avatar(1),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, contentPadding: EdgeInsets.all(10), hintText: '名称'),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, contentPadding: EdgeInsets.all(10), hintText: '状态'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, contentPadding: EdgeInsets.all(10), hintText: '部门'),
                  ),
                  TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(filled: true, fillColor: Colors.white, contentPadding: EdgeInsets.all(10), hintText: '职务'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("是否被搜索到"),
                  Switch(
                    value: true,
                    onChanged: (i) => {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

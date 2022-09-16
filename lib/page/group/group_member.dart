import 'package:flutter/material.dart';

class GroupMember extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupMemberState();
}

class GroupMemberState extends State<GroupMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "群成员",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Text("群成员列表"),
    );
  }
}

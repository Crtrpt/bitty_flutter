import 'package:flutter/material.dart';

class GroupCreate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _group_create_state();
}

class _group_create_state extends State<GroupCreate> {
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
          "创建群组",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Text("群组"),
    );
  }
}

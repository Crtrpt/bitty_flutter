import 'package:flutter/material.dart';

class GroupProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _group_profile_state();
}

class _group_profile_state extends State<GroupProfile> {
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
          "群组信息",
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

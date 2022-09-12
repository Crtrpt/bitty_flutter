import 'package:flutter/material.dart';

class AccountGroup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _account_group_state();
}

class _account_group_state extends State<AccountGroup> {
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
          "群组设置",
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

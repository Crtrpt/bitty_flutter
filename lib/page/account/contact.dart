import 'package:flutter/material.dart';

class AccountContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _account_contact_state();
}

class _account_contact_state extends State<AccountContact> {
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
          "联系人设置",
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

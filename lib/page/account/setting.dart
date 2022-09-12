import 'package:flutter/material.dart';

class AccountSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _account_setting_state();
}

class _account_setting_state extends State<AccountSetting> {
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
          "账号设置",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Text("账号设置"),
    );
  }
}

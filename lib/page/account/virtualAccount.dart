import 'package:flutter/material.dart';

class VirtualAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VirtualAccountState();
}

class VirtualAccountState extends State<VirtualAccount> {
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
          "虚拟账户",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: Text("创建虚拟账户"),
    );
  }
}

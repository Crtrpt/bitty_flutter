import 'package:flutter/material.dart';

class ContactProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _contact_profile_state();
}

class _contact_profile_state extends State<ContactProfile> {
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
          "联系人信息",
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

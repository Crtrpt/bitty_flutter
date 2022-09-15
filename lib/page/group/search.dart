import 'package:flutter/material.dart';

class GroupSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GroupSearchState();
}

class GroupSearchState extends State<GroupSearch> {
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
          "群组搜索",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        actions: [
          //搜索
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                Navigator.pushNamed(context, "/group/search");
              }),
        ],
      ),
      body: Text("群组"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/group_store.dart';
import 'item.dart';

class Group extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.add),
            color: Colors.grey,
            onPressed: () {
              Navigator.pushNamed(context, "/group/create");
            }),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "群组",
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
      body: Container(
        color: Colors.white,
        child: BlocBuilder<GroupStore, GroupState>(
            builder: (context, state) => Column(
                  children: state.list.map((e) => GroupItem(e)).toList(),
                )),
      ),
    );
  }
}

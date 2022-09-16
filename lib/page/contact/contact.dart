import 'package:bitty/page/contact/item.dart';
import 'package:bitty/utils/listBehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';

class Contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SessionState();
}

class SessionState extends State<Contact> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      AppBar(
        leading: null,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.5,
        title: Text(
          "联系人",
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
                Navigator.pushNamed(context, "/contact/search");
              }),
        ],
      ),
      Expanded(
        child: ScrollConfiguration(
          behavior: ListBehavior(),
          child: BlocBuilder<ContactStore, ContactState>(
              builder: (context, state) => Column(
                    children: state.list.map((e) => ContactItem(e)).toList(),
                  )),
        ),
      ),
    ]));
  }
}

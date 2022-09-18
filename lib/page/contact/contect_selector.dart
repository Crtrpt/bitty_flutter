import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';
import 'checkboxv1.dart';
import 'item.dart';

class ContactSelector extends StatefulWidget {
  Function? selected;
  ContactSelector({this.selected});
  @override
  State<StatefulWidget> createState() =>
      ContactSelectorState(selected: this.selected);
}

class ContactSelectorState extends State<ContactSelector> {
  ContactSelectorState({this.selected});
  List<String> userids = [];
  int count = 0;
  Function? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            }),
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0.5,
        actions: [
          IconButton(
              icon: Icon(Icons.cancel),
              color: Colors.red.shade500,
              onPressed: () {
                print("取消====");
                Navigator.pop(context);
              }),
          IconButton(
              icon: Icon(Icons.check),
              color: Colors.green.shade500,
              onPressed: () {
                print("回调====");
                this.selected?.call(context, userids);
              })
        ],
        title: Text(
          "选择(${count})",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: BlocBuilder<ContactStore, ContactState>(
          builder: (context, state) => Column(
                children: state.list
                    .map((e) => ContactItem(
                          e,
                          onTap: () => {},
                          action: [
                            CheckBoxV1(
                              onChanged: (value) {
                                if (value!) {
                                  userids.add(e.contact?.user_id! ?? '');
                                } else {
                                  userids.remove(e.contact?.user_id!);
                                }
                                setState(() {
                                  count = userids.length;
                                });
                              },
                            ),
                          ],
                        ))
                    .toList(),
              )),
    );
  }
}

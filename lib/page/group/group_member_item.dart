import 'package:bitty/model/group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMemberItem extends StatelessWidget {
  GroupMemberItem(this.user);
  final GroupMember user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Container(
            //   padding: EdgeInsets.only(left: 0, right: 10),
            //   child: Stack(children: [
            //     Text("头像"),
            //   ]),
            // ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.only(left: 0),
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Colors.grey.shade200),
                )),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name ?? '',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade700),
                              ),
                              Text(
                                user.created_at ?? '',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade500),
                              ),
                            ],
                          )),
                    ]),
              ),
            ),
          ]),
        ));
  }
}

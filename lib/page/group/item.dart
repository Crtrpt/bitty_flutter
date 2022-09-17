import 'package:bitty/page/group/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/group_store.dart';
import '../../model/group.dart';

class GroupItem extends StatelessWidget {
  GroupItem(this.group);
  final GroupList group;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              BlocProvider.of<GroupStore>(context, listen: false)
                  .setCur(group.group!.group_id!),
              Navigator.pushNamed(context, "/group/profile")
            },
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Stack(children: [GroupAvatar(group.group)]),
                ),
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
                          color: Colors.grey.shade300),
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
                                    this.group.group?.name ?? "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      this.group.group?.description ?? "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            child: Container(
                              child: Text(
                                "${group.group?.member_count}/${group.group?.max_member_count}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey.shade500),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ]),
            )));
  }
}

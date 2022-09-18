import 'package:bitty/component/Avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';
import '../../model/contact.dart';
import 'avatar.dart';

class ContactItem extends StatelessWidget {
  ContactItem(this.contact, {this.leading, this.action, this.onTap});
  Widget? leading;
  List<Widget>? action;
  Function? onTap;
  final ContactList contact;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {},
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Stack(children: [
                    ContactAvatar(contact.user),
                  ]),
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
                                    this.contact.user?.nick_name ?? "",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade700),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      this.contact.user?.status ?? "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade500),
                                    ),
                                  ),
                                ],
                              )),
                          ...action ?? []
                        ]),
                  ),
                ),
              ]),
            )));
  }
}

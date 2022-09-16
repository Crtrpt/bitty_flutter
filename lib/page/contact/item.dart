import 'package:bitty/component/Avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';
import '../model/contact.dart';
import 'avatar.dart';

class ContactItem extends StatelessWidget {
  ContactItem(this.contact);
  final ContactList contact;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              BlocProvider.of<ContactStore>(context, listen: false)
                  .setCur(contact.contact!.target_id!),
              Navigator.pushNamed(context, "/contact/profile")
            },
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Container(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(left: 0, right: 10),
                  child: Stack(children: [
                    ContactAvatar(contact),
                    // Positioned(
                    //     top: 0,
                    //     right: 0,
                    //     child: Container(
                    //       width: 10,
                    //       height: 10,
                    //       decoration: new BoxDecoration(
                    //         color: Colors.red.shade500,
                    //         shape: BoxShape.circle,
                    //       ),
                    //     )),
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
                                  )
                                ],
                              )),
                          // SizedBox(
                          //   child: Container(
                          //     child: Text(
                          //       "刚刚",
                          //       style: TextStyle(
                          //           fontSize: 12, color: Colors.grey.shade500),
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ),
                ),
              ]),
            )));
  }
}

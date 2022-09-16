import 'package:bitty/page/contact/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';

class ContactProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ContactProfileState();
}

class ContactProfileState extends State<ContactProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactStore, ContactState>(
        builder: (context, state) => Scaffold(
              backgroundColor: Colors.white,
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
                title: Text(
                  "${state.cur?.contact?.name}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: Row(
                          children: [
                            ContactAvatar(
                              state.cur,
                              size: 60,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.cur?.contact?.name ?? '',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    state.cur?.user?.status ?? '',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey.shade500),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () => {},
                              child: Text("发起聊天"),
                            ),
                            OutlinedButton(
                              onPressed: () => {},
                              child: Text(
                                "删除",
                                style: TextStyle(color: Colors.red.shade500),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}

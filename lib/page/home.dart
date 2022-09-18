import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/event.dart';
import '../state/userStore.dart';
import 'drawer_avatar.dart';
import 'group/group.dart';
import 'contact/contact.dart';
import 'session/session.dart';

class MainPage extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var idx = 0;

  late TabController _controller =
      new TabController(initialIndex: 0, length: 3, vsync: this);

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    this._controller.addListener(() {
      setState(() {
        idx = this._controller.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: BlocBuilder<UserStore, AuthState>(builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child:
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  DrawerAvatar(
                    state.user,
                    size: 80,
                  ),
                  Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                            verticalDirection: VerticalDirection.up,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  state.user?.status ?? '',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade500),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  state.user?.nick_name ?? '',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey.shade500),
                                ),
                              )
                            ]),
                      )),
                ]),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('设置'),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/account/profile");
                },
              ),
              // ListTile(
              //   title: Text('群组设置'),
              //   onTap: () {
              //     Navigator.popAndPushNamed(context, "/account/group");
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('联系人设置'),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/account/contact");
                },
              ),
              ListTile(
                leading: Icon(Icons.person_pin),
                title: Text("虚拟账户"),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/account/virtual_account",
                      arguments: {"union_id": state.union_id});
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: const Text("退出"),
                onTap: () {
                  Navigator.pop(context);
                  BlocProvider.of<UserStore>(context, listen: false)
                      .add(LogoutEvent());
                },
              ),
            ],
          );
        }),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Session(
            opendrawer: () => {scaffoldKey.currentState?.openDrawer()},
          ),
          Contact(),
          Group()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          this._controller.animateTo(i);
        },
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.adjust_sharp), label: "会话"),
          BottomNavigationBarItem(icon: Icon(Icons.data_usage), label: "联系人"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "群组"),
        ],
      ),
    );
  }
}

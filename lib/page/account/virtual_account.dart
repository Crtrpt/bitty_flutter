import 'package:bitty/api/api.dart';
import 'package:bitty/model/user.dart';
import 'package:bitty/page/account/account_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/contact_store.dart';
import '../../state/event.dart';
import '../../state/group_store.dart';
import '../../state/session_store.dart';
import '../../state/userStore.dart';

class VirtualAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => VirtualAccountState();
}

class VirtualAccountState extends State<VirtualAccount> {
  late TextEditingController nameController;

  String? union_id;
  List<User> accountList = [];
  int count = 0;
  Key? buildKey = ValueKey(DateTime.now().millisecondsSinceEpoch);
  @override
  void initState() {
    super.initState();
    nameController = new TextEditingController();
  }

  createAccount() {
    Api.post("account/create",
            body: {'nick_name': nameController.value.text.toString()})
        .then((res) => {print(res)});
  }

  switchUser(User user) {
    print("切换 user==================");
    Api.post("account/switch", body: {'user_id': user.user_id}).then((res) =>
        {BlocProvider.of<UserStore>(context).add(LoginEvent(res['data']))});
    BlocProvider.of<SessionStore>(context).add(InitEvent());
    BlocProvider.of<GroupStore>(context).add(InitEvent());
    BlocProvider.of<ContactStore>(context).add(InitEvent());
  }

  Future<List<User>> fetchList(String unionId) async {
    var res = await Api.get("account/list?union_id=" + unionId);
    if (res['code'] == 0) {
      accountList.clear();
      (res['data'] as List).forEach((item) {
        accountList.add(User.fromJson(item));
      });
      // setState(() {
      //   count = this.accountList.length ?? 0;
      // });
      return Future.value(accountList);
    }
    return Future.value([]);
  }

  @override
  Widget build(BuildContext context) {
    union_id = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)["union_id"];
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
        centerTitle: true,
        elevation: 0.5,
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              color: Colors.grey,
              onPressed: () {
                setState(() {
                  buildKey = ValueKey(20);
                });
              }),
          IconButton(
              icon: Icon(Icons.add),
              color: Colors.grey,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("创建新虚拟账户"),
                          content: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                hintText: "账户名称"),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () => {createAccount()},
                                child: Text("确认")),
                            OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("取消"))
                          ],
                        ));
              })
        ],
        title: Text(
          "虚拟账户",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
      body: FutureBuilder(
          key: buildKey,
          future: fetchList(union_id!),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot res) {
            if (res.hasError) {
              return Text(res.error.toString());
            }
            return res.connectionState == ConnectionState.done
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    itemCount: res.data.length,
                    itemBuilder: (context, idx) {
                      return AccountItem(res.data[idx],
                          onSwitch: () => switchUser(res.data[idx]));
                    })
                : Center(
                    child: Text("加载中..."),
                  );
          }),
    );
  }
}

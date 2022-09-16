import 'package:bitty/page/auth/loginForm.dart';
import 'package:bitty/state/contact_store.dart';
import 'package:bitty/state/event.dart';
import 'package:bitty/state/group_store.dart';
import 'package:bitty/state/userStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api.dart';
import '../../state/session_store.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  Loginform form = new Loginform();
  late TextEditingController account;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    account = new TextEditingController();
    password = new TextEditingController();
    account.addListener(() {
      form.account = account.value.text.toString();
    });
    password.addListener(() {
      form.password = password.value.text.toString();
    });
    print(form);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    account.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color.fromARGB(50, 255, 255, 255),
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
          child: Center(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "登录",
                      style: TextStyle(
                          fontSize: 40, color: Color.fromARGB(255, 55, 55, 55)),
                    ),
                  ),
                  TextFormField(
                    controller: account,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.check),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                        ),
                        hintText: "输入登陆账号"),
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ),
                        hintText: "输入登陆密码"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                              width: 10,
                              height: 10,
                              child: Checkbox(
                                  value: form.agree,
                                  onChanged: (v) {
                                    setState(() {
                                      form.agree = v!;
                                    });
                                  })),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              form.agree = !form.agree;
                            });
                          },
                          child: Text("我同意授权"),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, "/license"),
                          child: Padding(
                            padding: EdgeInsets.only(left: 2, right: 2),
                            child: Text(
                              "许可协议",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Text("和"),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, "/privacy_policy"),
                          child: Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text(
                              "隐私条款",
                              style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                          height: 10,
                          child: Checkbox(
                              value: form.rememenber,
                              onChanged: (v) {
                                setState(() {
                                  form.rememenber = v!;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  form.rememenber = !form.rememenber;
                                });
                              },
                              child: Text("记住账号")),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (!form.agree) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('用户必须同意许可协议和隐私条款才能使用该应用'),
                              ));
                              return;
                            }
                            Api.post("auth/login", body: form).then((res) {
                              if (res['code'] == 0) {
                                BlocProvider.of<UserStore>(context)
                                    .add(LoginEvent(res['data']));
                                BlocProvider.of<SessionStore>(context)
                                    .add(InitEvent());
                                BlocProvider.of<GroupStore>(context)
                                    .add(InitEvent());
                                BlocProvider.of<ContactStore>(context)
                                    .add(InitEvent());
                              } else {
                                throw Exception(res['msg']);
                              }
                            }).catchError((e) {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('提示'),
                                        backgroundColor: Colors.red,
                                        content: Text(e.toString()),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => {
                                              Navigator.popAndPushNamed(
                                                  context, "/auth/findpassword")
                                            },
                                            child: const Text('找回密码'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('返回'),
                                          ),
                                        ],
                                      ));
                            });
                          },
                          child: Text("登陆")),
                      OutlinedButton(
                          onPressed: () =>
                              {Navigator.pushNamed(context, "/auth/signup")},
                          child: Text("去注册")),
                      OutlinedButton(
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, "/auth/findpassword")
                              },
                          child: Text("找回密码")),
                    ],
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}

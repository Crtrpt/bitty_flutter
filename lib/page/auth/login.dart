import 'package:dino/page/auth/loginForm.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
      decoration: BoxDecoration(
          gradient:
              LinearGradient(stops: [0.2, 0.5, 0.8, 0.7], colors: [Colors.blue[50]!, Colors.blue[100]!, Colors.blue[200]!, Colors.blue[300]!], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: Form(
          child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 240, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: account,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.check),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      hintText: "输入登陆账号"),
                ),
                TextFormField(
                  controller: password,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                      hintText: "输入登陆密码"),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Checkbox(
                          value: form.rememenber,
                          onChanged: (v) {
                            setState(() {
                              form.rememenber = v;
                            });
                          }),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/license");
                        },
                        child: Text("我同意授权许可协议"),
                      )
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(
                          500,
                          45,
                        ),
                      ),
                      onPressed: () {
                        state.Login(form).then((value) {
                          Navigator.pushNamed(context, "/home");
                        }).catchError((e) {
                          print(e);
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('提示'),
                                    content: Text(e.toString()),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {Navigator.popAndPushNamed(context, "/auth/findpassword")},
                                        child: const Text('找回密码'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'OK'),
                                        child: const Text('返回'),
                                      ),
                                    ],
                                  ));
                        });
                      },
                      child: Text("登陆", style: TextStyle(fontSize: 20))),
                )
              ],
            ),
          )),
          Positioned(
              child: Center(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/auth/signup")}, child: Text("去注册")),
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/auth/findpassword")}, child: Text("找回密码")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "v0.0.1",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  )
                ],
              )),
              bottom: 10,
              width: MediaQuery.of(context).size.width)
        ],
      )),
    ));
  }
}

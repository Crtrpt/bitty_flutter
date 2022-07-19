import 'package:dino/page/auth/signupForm.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Signupform form = new Signupform();
  late TextEditingController account;
  late TextEditingController password;
  late TextEditingController email;
  @override
  void initState() {
    super.initState();
    account = new TextEditingController();
    password = new TextEditingController();
    email = new TextEditingController();
    account.addListener(() {
      form.account = account.value.text.toString();
    });
    password.addListener(() {
      form.password = password.value.text.toString();
    });
    email.addListener(() {
      form.email = email.value.text.toString();
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    account.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: [0.2, 0.5, 0.8, 0.7],
        colors: [Colors.blue[50]!, Colors.blue[100]!, Colors.blue[200]!, Colors.blue[300]!],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: Form(
          child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   child: Image.network("https://bing.nanxiongnandi.com/202204/NorwayBoulder_1920x1080.jpg"),
          // ),
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 240, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: account,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.check),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      hintText: "账号"),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: password,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      hintText: "密码"),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: email,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                      hintText: "邮箱"),
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (v) {}),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/license");
                      },
                      child: Text("我同意授权许可协议"),
                    )
                  ],
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
                        state.Signup(form).then((value) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('提示'),
                                    content: Text("注册成功"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {Navigator.popAndPushNamed(context, "/auth/login")},
                                        child: const Text('去登陆'),
                                      )
                                    ],
                                  ));
                        }).catchError((e) {
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
                      child: Text("注册", style: TextStyle(fontSize: 20))),
                )
              ],
            ),
          )),
        ],
      )),
    ));
  }
}

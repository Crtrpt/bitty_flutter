import 'package:dino/page/auth/resetpassword.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class FindPassword extends StatefulWidget {
  @override
  State<FindPassword> createState() => _FindPasswordState();
}

class _FindPasswordState extends State<FindPassword> {
  ResetPasswordform form = new ResetPasswordform();
  late TextEditingController account;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController code;
  @override
  void initState() {
    super.initState();
    account = new TextEditingController();
    password = new TextEditingController();
    email = new TextEditingController();
    code = new TextEditingController();
    account.addListener(() {
      form.account = account.value.text.toString();
    });
    password.addListener(() {
      form.password = password.value.text.toString();
    });
    email.addListener(() {
      form.email = email.value.text.toString();
    });
    code.addListener(() {
      form.code = code.value.text.toString();
    });
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
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 180, left: 10, right: 10),
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
                      hintText: "账号"),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(
                            500,
                            45,
                          ),
                        ),
                        onPressed: () {
                          state.sendCode(form).then((value) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('提示'),
                                      content: Text("发送验证码成功"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('返回'),
                                        ),
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
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('返回'),
                                        ),
                                      ],
                                    ));
                          });
                        },
                        child: Text("发送验证码", style: TextStyle(fontSize: 20))),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: code,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.code),
                      suffixIcon: Icon(Icons.lock_clock),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      hintText: "验证码"),
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
                      hintText: "新密码"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(
                            500,
                            45,
                          ),
                        ),
                        onPressed: () {
                          state.resetPassword(form).then((value) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('提示'),
                                      content: Text("重置密码成功"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {Navigator.popAndPushNamed(context, "/auth/login")},
                                          child: const Text('去登陆'),
                                        ),
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
                                          onPressed: () => Navigator.pop(context, 'OK'),
                                          child: const Text('返回'),
                                        ),
                                      ],
                                    ));
                          });
                        },
                        child: Text("确认", style: TextStyle(fontSize: 20))),
                  ),
                ),
              ],
            ),
          )),
        ],
      )),
    ));
  }
}

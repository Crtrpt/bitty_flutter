import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../main.dart';
import 'resetpasswordForm.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ResetPasswordForm form = new ResetPasswordForm();
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
      child: Form(
          child: Stack(
        children: [
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "找回密码",
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
                      hintText: "账号"),
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email),
                      suffixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      hintText: "邮箱"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Api.post("auth/sendcode", body: form).then((value) {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('提示'),
                                      content: Text("发送验证码成功"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
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
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('返回'),
                                        ),
                                      ],
                                    ));
                          });
                        },
                        child: Text("发送验证码")),
                  ],
                ),
                TextFormField(
                  controller: code,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.code),
                      suffixIcon: Icon(Icons.lock_clock),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                      ),
                      hintText: "验证码"),
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
                      hintText: "新密码"),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Api.post("auth/resetpassword", body: form)
                                .then((value) {
                              if (value['code'] == 0) {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('提示'),
                                          content: Text("重置密码成功"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => {
                                                Navigator.popAndPushNamed(
                                                    context, "/auth/login")
                                              },
                                              child: const Text('去登陆'),
                                            ),
                                          ],
                                        ));
                              }
                            }).catchError((e) {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text('提示'),
                                        content: Text(e.toString()),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text('返回'),
                                          ),
                                        ],
                                      ));
                            });
                          },
                          child: Text("确认")),
                    ]),
              ],
            ),
          )),
        ],
      )),
    ));
  }
}

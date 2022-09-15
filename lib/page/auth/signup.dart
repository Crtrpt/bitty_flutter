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
    account.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Padding(
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "注册",
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
              Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                      height: 10,
                      child: Checkbox(
                          value: false,
                          onChanged: (v) {
                            setState(() {
                              form.agree = v!;
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/license");
                        },
                        child: Text("我同意"),
                      ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!form.agree) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('用户必须同意许可协议和隐私条款才能使用该应用'),
                        ));
                        return;
                      }
                      state.Signup(form).then((value) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('提示'),
                                  content: Text("注册成功"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => {
                                        Navigator.popAndPushNamed(
                                            context, "/auth/login")
                                      },
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
                    child: Text("注册"),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

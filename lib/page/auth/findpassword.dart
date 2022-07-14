import 'package:flutter/material.dart';

class FindPassword extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 180, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
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
                          //TODO  发送验证码
                        },
                        child: Text("发送验证码", style: TextStyle(fontSize: 20))),
                  ),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
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
                          Navigator.pushNamed(context, "/home");
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

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Stack(
        children: [
          // Positioned(
          //   top: 0,
          //   bottom: 0,
          //   child: Image.network("https://bing.nanxiongnandi.com/202204/NorwayBoulder_1920x1080.jpg"),
          // ),
          Positioned(
              child: Padding(
            padding: EdgeInsets.only(top: 200, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.all(10),
                //     child: Container(
                //       child: CircleAvatar(
                //         radius: 40,
                //         child: Image.network("https://api.multiavatar.com/" + faker.person.name() + ".png"),
                //       ),
                //     ),
                //   ),
                // ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      ),
                      hintText: '输入账户'),
                ),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.password),
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                      ),
                      hintText: '输入密码'),
                ),
                Row(
                  children: [Checkbox(value: false, onChanged: (v) {}), Text("同意许可协议")],
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
                        Navigator.pushNamed(context, "/home");
                      },
                      child: Text("登录", style: TextStyle(fontSize: 20))),
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
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/auth/signup")}, child: Text("注册")),
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/user/findpassword")}, child: Text("找回密码"))
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
    );
  }
}

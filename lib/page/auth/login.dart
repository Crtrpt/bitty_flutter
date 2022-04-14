import 'package:dino/i18n/default.i18n.dart';
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
                      hintText: 'inputYourAccount'.i18n),
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
                      hintText: 'inputYourPassword'.i18n),
                ),
                Row(
                  children: [Checkbox(value: false, onChanged: (v) {}), Text("agreeLicense".i18n)],
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
                      child: Text("loginBtn".i18n, style: TextStyle(fontSize: 20))),
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
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/auth/signup")}, child: Text("signupLink".i18n)),
                      TextButton(onPressed: () => {Navigator.pushNamed(context, "/user/findpassword")}, child: Text("findPasswordLink".i18n))
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
